import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expense_model.dart';

class ExpenseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'expenses';

  // Get all expenses for a user
  Stream<List<Expense>> getExpenses(String userId) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Expense.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  // Get a single expense by ID
  Future<Expense?> getExpense(String expenseId) async {
    try {
      final doc = await _firestore.collection(_collection).doc(expenseId).get();
      if (doc.exists) {
        return Expense.fromMap(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get expense: $e');
    }
  }

  // Add a new expense
  Future<void> addExpense(Expense expense) async {
    await _firestore.collection(_collection).add(expense.toMap());
  }

  // Update an existing expense
  Future<void> updateExpense(Expense expense) async {
    if (expense.id != null) {
      await _firestore.collection(_collection).doc(expense.id).update(expense.toMap());
    }
  }

  // Delete an expense
  Future<void> deleteExpense(String expenseId) async {
    await _firestore.collection(_collection).doc(expenseId).delete();
  }

  // Get expenses by category
  Stream<List<Expense>> getExpensesByCategory(String userId, String category) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .where('category', isEqualTo: category)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Expense.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  // Get total expenses for a user
  Future<double> getTotalExpenses(String userId) async {
    try {
      final snapshot = await _firestore
          .collection(_collection)
          .where('userId', isEqualTo: userId)
          .get();

      double total = 0;
      for (var doc in snapshot.docs) {
        total += (doc.data()['amount'] ?? 0).toDouble();
      }
      return total;
    } catch (e) {
      throw Exception('Failed to get total expenses: $e');
    }
  }

  // Get expenses for a specific date range
  Stream<List<Expense>> getExpensesByDateRange(
      String userId, DateTime startDate, DateTime endDate) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Expense.fromMap(doc.data(), doc.id))
          .toList();
    });
  }
}
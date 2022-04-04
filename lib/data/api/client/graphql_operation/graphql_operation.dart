import 'package:equatable/equatable.dart';

abstract class GraphQLOperation extends Equatable {
  final String operation;
  final Map<String, dynamic> variables;

  const GraphQLOperation({required this.operation, this.variables = const {}});

  @override
  List<Object?> get props => [operation, variables];
}

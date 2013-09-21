/*
 * rreil_statement.h
 *
 *  Created on: 03.05.2013
 *      Author: jucs
 */

#ifndef RREIL_STATEMENT_H_
#define RREIL_STATEMENT_H_

#include <stdint.h>
#include <rreil/rreil_variable.h>
#include <rreil/rreil_expr.h>
#include <rreil/rreil_address.h>
#include <rreil/rreil_sexpr.h>
#include <rreil/rreil_branch_hint.h>

struct rreil_statements;

enum rreil_statement_type {
	RREIL_STATEMENT_TYPE_ASSIGN,
	RREIL_STATEMENT_TYPE_LOAD,
	RREIL_STATEMENT_TYPE_STORE,
	RREIL_STATEMENT_TYPE_ITE,
	RREIL_STATEMENT_TYPE_WHILE,
	RREIL_STATEMENT_TYPE_CBRANCH,
	RREIL_STATEMENT_TYPE_BRANCH,
	RREIL_STATEMENT_TYPE_FLOP,
	RREIL_STATEMENT_TYPE_PRIM
};

struct rreil_statement {
	enum rreil_statement_type type;
	union {
		struct {
			uint64_t size;
			struct rreil_variable *lhs;
			struct rreil_expr *rhs;
		} assign;
		struct {
			uint64_t size;
			struct rreil_variable *lhs;
			struct rreil_address *address;
		} load;
		struct {
			uint64_t size;
			struct rreil_address *address;
			struct rreil_expr *rhs;
		} store;
		struct {
			struct rreil_sexpr *cond;
			struct rreil_statements *then_branch;
			struct rreil_statements *else_branch;
		} ite;
		struct {
			struct rreil_sexpr *cond;
			struct rreil_statements *body;
		} while_;
		struct {
			struct rreil_sexpr *cond;
			struct rreil_address *target_true;
			struct rreil_address *target_false;
		} cbranch;
		struct {
			enum rreil_branch_hint *hint;
			struct rreil_address *target;
		} branch;
		struct {
			enum rreil_flop *op;
			struct rreil_variable *flags;
			struct rreil_variable_limited *lhs;
			struct rreil_variable_limited_tuple *rhs;
		} flop;
		struct {
			char *op;
			struct rreil_variable_limited_tuple *lhs;
			struct rreil_variable_limited_tuple *rhs;
		} prim;
	};
};

struct rreil_statements {
	struct rreil_statement **statements;
	size_t statements_length;
	size_t statements_size;
};

#endif /* RREIL_STATEMENT_H_ */

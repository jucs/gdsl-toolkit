/*
 * simulator_tracking.h
 *
 *  Created on: 11.05.2013
 *      Author: jucs
 */

#ifndef SIMULATOR_TRACKING_H_
#define SIMULATOR_TRACKING_H_

#include <stdlib.h>
#include <simulator/simulator.h>

struct register_access {
	struct register_ *x86_registers;
	size_t *indices;
	size_t indices_length;
	size_t indices_size;
};

struct simulator_trace {
	struct register_access read;
	struct register_access written;
};

extern void tracking_statements_trace(struct simulator_trace *trace,
		struct rreil_statements *statements);
extern struct simulator_trace *tracking_trace_init();
extern void tracking_trace_print(struct simulator_trace *trace);
extern void tracking_trace_free(struct simulator_trace *trace);

#endif /* SIMULATOR_TRACKING_H_ */

/*
 * gdsl_decoder_Instruction.c
 *
 *  Created on: Feb 14, 2014
 *      Author: jucs
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <jni.h>
#include <gdsl.h>
#include <gdsl_multiplex.h>
#include "gdsl_decoder_Instruction.h"
#include "util.h"

JNIEXPORT jstring JNICALL Java_gdsl_decoder_Instruction_pretty(JNIEnv *env, jobject this, jlong frontendPtr,
		jlong gdslStatePtr, jlong insnPtr) {
	struct frontend *frontend = (struct frontend*)frontendPtr;
	state_t state = (state_t)gdslStatePtr;
	obj_t insn = (obj_t)insnPtr;

	if(setjmp(*frontend->generic.err_tgt(state)))
	THROW_GDSL_EXCEPTION_RET(NULL)

	string_t str = frontend->generic.merge_rope(state, frontend->decoder.pretty(state, insn));

	return (*env)->NewStringUTF(env, str);
}

JNIEXPORT jint JNICALL Java_gdsl_decoder_Instruction_operands(JNIEnv *env, jobject this, jlong frontendPtr,
		jlong gdslStatePtr, jlong insnPtr) {
	struct frontend *frontend = (struct frontend*)frontendPtr;
	state_t state = (state_t)gdslStatePtr;
	obj_t insn = (obj_t)insnPtr;

	if(setjmp(*frontend->generic.err_tgt(state)))
	THROW_GDSL_EXCEPTION_RET(0)

	return (jint)frontend->decoder.operands(state, insn);
}

JNIEXPORT jstring JNICALL Java_gdsl_decoder_Instruction_prettyOperand(JNIEnv *env, jobject this, jlong frontendPtr,
		jlong gdslStatePtr, jlong insnPtr, jint operand) {
	struct frontend *frontend = (struct frontend*)frontendPtr;
	state_t state = (state_t)gdslStatePtr;
	obj_t insn = (obj_t)insnPtr;

	if(setjmp(*frontend->generic.err_tgt(state)))
	THROW_GDSL_EXCEPTION_RET(NULL)

	string_t str = frontend->generic.merge_rope(state, frontend->decoder.pretty_operand(state, insn, (int_t)operand));

	return (*env)->NewStringUTF(env, str);
}

JNIEXPORT jint JNICALL Java_gdsl_decoder_Instruction_operandType(JNIEnv *env, jobject this, jlong frontendPtr,
		jlong gdslStatePtr, jlong insnPtr, jint operand) {
	struct frontend *frontend = (struct frontend*)frontendPtr;
	state_t state = (state_t)gdslStatePtr;
	obj_t insn = (obj_t)insnPtr;

	if(setjmp(*frontend->generic.err_tgt(state)))
	THROW_GDSL_EXCEPTION_RET(0)

	int_t type = frontend->decoder.typeof_opnd(state, insn, (int_t)operand);

	return type;
}

JNIEXPORT jstring JNICALL Java_gdsl_decoder_Instruction_mnemonic(JNIEnv *env, jobject this, jlong frontendPtr,
		jlong gdslStatePtr, jlong insnPtr) {
	struct frontend *frontend = (struct frontend*)frontendPtr;
	state_t state = (state_t)gdslStatePtr;
	obj_t insn = (obj_t)insnPtr;

	if(setjmp(*frontend->generic.err_tgt(state)))
	THROW_GDSL_EXCEPTION_RET(NULL)

	string_t str = frontend->generic.merge_rope(state, frontend->decoder.pretty_mnemonic(state, insn));

	return (*env)->NewStringUTF(env, str);
}

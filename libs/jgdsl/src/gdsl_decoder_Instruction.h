/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class gdsl_decoder_Instruction */

#ifndef _Included_gdsl_decoder_Instruction
#define _Included_gdsl_decoder_Instruction
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     gdsl_decoder_Instruction
 * Method:    pretty
 * Signature: (JJJ)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_gdsl_decoder_Instruction_pretty
  (JNIEnv *, jobject, jlong, jlong, jlong);

/*
 * Class:     gdsl_decoder_Instruction
 * Method:    operands
 * Signature: (JJJ)I
 */
JNIEXPORT jint JNICALL Java_gdsl_decoder_Instruction_operands
  (JNIEnv *, jobject, jlong, jlong, jlong);

/*
 * Class:     gdsl_decoder_Instruction
 * Method:    prettyOperand
 * Signature: (JJJI)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_gdsl_decoder_Instruction_prettyOperand
  (JNIEnv *, jobject, jlong, jlong, jlong, jint);

/*
 * Class:     gdsl_decoder_Instruction
 * Method:    operandType
 * Signature: (JJJI)I
 */
JNIEXPORT jint JNICALL Java_gdsl_decoder_Instruction_operandType
  (JNIEnv *, jobject, jlong, jlong, jlong, jint);

/*
 * Class:     gdsl_decoder_Instruction
 * Method:    mnemonic
 * Signature: (JJJ)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_gdsl_decoder_Instruction_mnemonic
  (JNIEnv *, jobject, jlong, jlong, jlong);

#ifdef __cplusplus
}
#endif
#endif

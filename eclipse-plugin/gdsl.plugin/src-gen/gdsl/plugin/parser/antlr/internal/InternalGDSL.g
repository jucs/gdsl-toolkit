/*
* generated by Xtext
*/
grammar InternalGDSL;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package gdsl.plugin.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package gdsl.plugin.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import gdsl.plugin.services.GDSLGrammarAccess;

}

@parser::members {

 	private GDSLGrammarAccess grammarAccess;
 	
    public InternalGDSLParser(TokenStream input, GDSLGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "Model";	
   	}
   	
   	@Override
   	protected GDSLGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleModel
entryRuleModel returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getModelRule()); }
	 iv_ruleModel=ruleModel 
	 { $current=$iv_ruleModel.current; } 
	 EOF 
;

// Rule Model
ruleModel returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getModelAccess().getDeclDeclParserRuleCall_0_0()); 
	    }
		lv_decl_0_0=ruleDecl		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getModelRule());
	        }
       		add(
       			$current, 
       			"decl",
        		lv_decl_0_0, 
        		"Decl");
	        afterParserOrEnumRuleCall();
	    }

)
)((	otherlv_1=';' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getModelAccess().getSemicolonKeyword_1_0());
    }
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getModelAccess().getDeclDeclParserRuleCall_1_1_0()); 
	    }
		lv_decl_2_0=ruleDecl		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getModelRule());
	        }
       		add(
       			$current, 
       			"decl",
        		lv_decl_2_0, 
        		"Decl");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleDecl
entryRuleDecl returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getDeclRule()); }
	 iv_ruleDecl=ruleDecl 
	 { $current=$iv_ruleDecl.current; } 
	 EOF 
;

// Rule Decl
ruleDecl returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
    { 
        newCompositeNode(grammarAccess.getDeclAccess().getDeclGranularityParserRuleCall_0()); 
    }
    this_DeclGranularity_0=ruleDeclGranularity
    { 
        $current = $this_DeclGranularity_0.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getDeclAccess().getDeclExportParserRuleCall_1()); 
    }
    this_DeclExport_1=ruleDeclExport
    { 
        $current = $this_DeclExport_1.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getDeclAccess().getDeclTypeParserRuleCall_2()); 
    }
    this_DeclType_2=ruleDeclType
    { 
        $current = $this_DeclType_2.current; 
        afterParserOrEnumRuleCall();
    }

    |
    { 
        newCompositeNode(grammarAccess.getDeclAccess().getDeclValParserRuleCall_3()); 
    }
    this_DeclVal_3=ruleDeclVal
    { 
        $current = $this_DeclVal_3.current; 
        afterParserOrEnumRuleCall();
    }
)
;





// Entry rule entryRuleDeclGranularity
entryRuleDeclGranularity returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getDeclGranularityRule()); }
	 iv_ruleDeclGranularity=ruleDeclGranularity 
	 { $current=$iv_ruleDeclGranularity.current; } 
	 EOF 
;

// Rule DeclGranularity
ruleDeclGranularity returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_name_0_0=	'granularity' 
    {
        newLeafNode(lv_name_0_0, grammarAccess.getDeclGranularityAccess().getNameGranularityKeyword_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclGranularityRule());
	        }
       		setWithLastConsumed($current, "name", lv_name_0_0, "granularity");
	    }

)
)	otherlv_1='=' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getDeclGranularityAccess().getEqualsSignKeyword_1());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getDeclGranularityAccess().getGranularityIntParserRuleCall_2_0()); 
	    }
		lv_granularity_2_0=ruleInt		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getDeclGranularityRule());
	        }
       		set(
       			$current, 
       			"granularity",
        		lv_granularity_2_0, 
        		"Int");
	        afterParserOrEnumRuleCall();
	    }

)
))
;





// Entry rule entryRuleDeclExport
entryRuleDeclExport returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getDeclExportRule()); }
	 iv_ruleDeclExport=ruleDeclExport 
	 { $current=$iv_ruleDeclExport.current; } 
	 EOF 
;

// Rule DeclExport
ruleDeclExport returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_name_0_0=	'export' 
    {
        newLeafNode(lv_name_0_0, grammarAccess.getDeclExportAccess().getNameExportKeyword_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclExportRule());
	        }
       		setWithLastConsumed($current, "name", lv_name_0_0, "export");
	    }

)
)	otherlv_1='=' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getDeclExportAccess().getEqualsSignKeyword_1());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getDeclExportAccess().getExportsExportParserRuleCall_2_0()); 
	    }
		lv_exports_2_0=ruleExport		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getDeclExportRule());
	        }
       		add(
       			$current, 
       			"exports",
        		lv_exports_2_0, 
        		"Export");
	        afterParserOrEnumRuleCall();
	    }

)
)*)
;





// Entry rule entryRuleDeclType
entryRuleDeclType returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getDeclTypeRule()); }
	 iv_ruleDeclType=ruleDeclType 
	 { $current=$iv_ruleDeclType.current; } 
	 EOF 
;

// Rule DeclType
ruleDeclType returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((	otherlv_0='type' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getDeclTypeAccess().getTypeKeyword_0_0());
    }
(
(
		lv_name_1_0=RULE_ID
		{
			newLeafNode(lv_name_1_0, grammarAccess.getDeclTypeAccess().getNameIDTerminalRuleCall_0_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclTypeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_1_0, 
        		"ID");
	    }

)
)	otherlv_2='=' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getDeclTypeAccess().getEqualsSignKeyword_0_2());
    }
(
(
(
		{ 
	        newCompositeNode(grammarAccess.getDeclTypeAccess().getValueConDeclsParserRuleCall_0_3_0_0()); 
	    }
		lv_value_3_1=ruleConDecls		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getDeclTypeRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_3_1, 
        		"ConDecls");
	        afterParserOrEnumRuleCall();
	    }

    |		{ 
	        newCompositeNode(grammarAccess.getDeclTypeAccess().getValueTyParserRuleCall_0_3_0_1()); 
	    }
		lv_value_3_2=ruleTy		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getDeclTypeRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_3_2, 
        		"Ty");
	        afterParserOrEnumRuleCall();
	    }

)

)
))
    |(	otherlv_4='type' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getDeclTypeAccess().getTypeKeyword_1_0());
    }
(
(
		lv_name_5_0=RULE_ID
		{
			newLeafNode(lv_name_5_0, grammarAccess.getDeclTypeAccess().getNameIDTerminalRuleCall_1_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclTypeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_5_0, 
        		"ID");
	    }

)
)	otherlv_6='[' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getDeclTypeAccess().getLeftSquareBracketKeyword_1_2());
    }
(
(
		lv_attrName_7_0=RULE_ID
		{
			newLeafNode(lv_attrName_7_0, grammarAccess.getDeclTypeAccess().getAttrNameIDTerminalRuleCall_1_3_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclTypeRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"attrName",
        		lv_attrName_7_0, 
        		"ID");
	    }

)
)(	otherlv_8=',' 
    {
    	newLeafNode(otherlv_8, grammarAccess.getDeclTypeAccess().getCommaKeyword_1_4_0());
    }
(
(
		lv_attrName_9_0=RULE_ID
		{
			newLeafNode(lv_attrName_9_0, grammarAccess.getDeclTypeAccess().getAttrNameIDTerminalRuleCall_1_4_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclTypeRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"attrName",
        		lv_attrName_9_0, 
        		"ID");
	    }

)
))*	otherlv_10=']' 
    {
    	newLeafNode(otherlv_10, grammarAccess.getDeclTypeAccess().getRightSquareBracketKeyword_1_5());
    }
	otherlv_11='=' 
    {
    	newLeafNode(otherlv_11, grammarAccess.getDeclTypeAccess().getEqualsSignKeyword_1_6());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getDeclTypeAccess().getValueConDeclsParserRuleCall_1_7_0()); 
	    }
		lv_value_12_0=ruleConDecls		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getDeclTypeRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_12_0, 
        		"ConDecls");
	        afterParserOrEnumRuleCall();
	    }

)
)))
;





// Entry rule entryRuleDeclVal
entryRuleDeclVal returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getDeclValRule()); }
	 iv_ruleDeclVal=ruleDeclVal 
	 { $current=$iv_ruleDeclVal.current; } 
	 EOF 
;

// Rule DeclVal
ruleDeclVal returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='val' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getDeclValAccess().getValKeyword_0());
    }
(
(
		lv_name_1_0=RULE_ID
		{
			newLeafNode(lv_name_1_0, grammarAccess.getDeclValAccess().getNameIDTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclValRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_1_0, 
        		"ID");
	    }

)
)(
(
		lv_attr_2_0=RULE_ID
		{
			newLeafNode(lv_attr_2_0, grammarAccess.getDeclValAccess().getAttrIDTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getDeclValRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"attr",
        		lv_attr_2_0, 
        		"ID");
	    }

)
)*)
;





// Entry rule entryRuleExport
entryRuleExport returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExportRule()); }
	 iv_ruleExport=ruleExport 
	 { $current=$iv_ruleExport.current; } 
	 EOF 
;

// Rule Export
ruleExport returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getExportAccess().getNameQidParserRuleCall_0_0()); 
	    }
		lv_name_0_0=ruleQid		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExportRule());
	        }
       		set(
       			$current, 
       			"name",
        		lv_name_0_0, 
        		"Qid");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_1='{' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getExportAccess().getLeftCurlyBracketKeyword_1_0());
    }
(
(
		lv_attrName_2_0=RULE_ID
		{
			newLeafNode(lv_attrName_2_0, grammarAccess.getExportAccess().getAttrNameIDTerminalRuleCall_1_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExportRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"attrName",
        		lv_attrName_2_0, 
        		"ID");
	    }

)
)(	otherlv_3=',' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getExportAccess().getCommaKeyword_1_2_0());
    }
(
(
		lv_attrName_4_0=RULE_ID
		{
			newLeafNode(lv_attrName_4_0, grammarAccess.getExportAccess().getAttrNameIDTerminalRuleCall_1_2_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExportRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"attrName",
        		lv_attrName_4_0, 
        		"ID");
	    }

)
))*	otherlv_5='}' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getExportAccess().getRightCurlyBracketKeyword_1_3());
    }
)?)
;





// Entry rule entryRuleConDecls
entryRuleConDecls returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getConDeclsRule()); }
	 iv_ruleConDecls=ruleConDecls 
	 { $current=$iv_ruleConDecls.current; } 
	 EOF 
;

// Rule ConDecls
ruleConDecls returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getConDeclsAccess().getConDeclsConDeclParserRuleCall_0_0()); 
	    }
		lv_conDecls_0_0=ruleConDecl		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getConDeclsRule());
	        }
       		add(
       			$current, 
       			"conDecls",
        		lv_conDecls_0_0, 
        		"ConDecl");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_1='|' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getConDeclsAccess().getVerticalLineKeyword_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getConDeclsAccess().getConDeclsConDeclParserRuleCall_1_1_0()); 
	    }
		lv_conDecls_2_0=ruleConDecl		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getConDeclsRule());
	        }
       		add(
       			$current, 
       			"conDecls",
        		lv_conDecls_2_0, 
        		"ConDecl");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleConDecl
entryRuleConDecl returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getConDeclRule()); }
	 iv_ruleConDecl=ruleConDecl 
	 { $current=$iv_ruleConDecl.current; } 
	 EOF 
;

// Rule ConDecl
ruleConDecl returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getConDeclAccess().getNameConBindParserRuleCall_0_0()); 
	    }
		lv_name_0_0=ruleConBind		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getConDeclRule());
	        }
       		set(
       			$current, 
       			"name",
        		lv_name_0_0, 
        		"ConBind");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_1='of' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getConDeclAccess().getOfKeyword_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getConDeclAccess().getTyTyParserRuleCall_1_1_0()); 
	    }
		lv_ty_2_0=ruleTy		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getConDeclRule());
	        }
       		set(
       			$current, 
       			"ty",
        		lv_ty_2_0, 
        		"Ty");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleTy
entryRuleTy returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getTyRule()); }
	 iv_ruleTy=ruleTy 
	 { $current=$iv_ruleTy.current; } 
	 EOF 
;

// Rule Ty
ruleTy returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getValueIntParserRuleCall_0_0()); 
	    }
		lv_value_0_0=ruleInt		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_0_0, 
        		"Int");
	        afterParserOrEnumRuleCall();
	    }

)
)
    |(	otherlv_1='|' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getTyAccess().getVerticalLineKeyword_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getValueIntParserRuleCall_1_1_0()); 
	    }
		lv_value_2_0=ruleInt		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_2_0, 
        		"Int");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_3='|' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getTyAccess().getVerticalLineKeyword_1_2());
    }
)
    |((
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getValueQidParserRuleCall_2_0_0()); 
	    }
		lv_value_4_0=ruleQid		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_4_0, 
        		"Qid");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_5='[' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getTyAccess().getLeftSquareBracketKeyword_2_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getTyBindTyBindParserRuleCall_2_1_1_0()); 
	    }
		lv_tyBind_6_0=ruleTyBind		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		add(
       			$current, 
       			"tyBind",
        		lv_tyBind_6_0, 
        		"TyBind");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_7=',' 
    {
    	newLeafNode(otherlv_7, grammarAccess.getTyAccess().getCommaKeyword_2_1_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getTyBindTyBindParserRuleCall_2_1_2_1_0()); 
	    }
		lv_tyBind_8_0=ruleTyBind		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		add(
       			$current, 
       			"tyBind",
        		lv_tyBind_8_0, 
        		"TyBind");
	        afterParserOrEnumRuleCall();
	    }

)
))*	otherlv_9=']' 
    {
    	newLeafNode(otherlv_9, grammarAccess.getTyAccess().getRightSquareBracketKeyword_2_1_3());
    }
)?)
    |(	otherlv_10='{' 
    {
    	newLeafNode(otherlv_10, grammarAccess.getTyAccess().getLeftCurlyBracketKeyword_3_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getElementsTyElementParserRuleCall_3_1_0()); 
	    }
		lv_elements_11_0=ruleTyElement		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		add(
       			$current, 
       			"elements",
        		lv_elements_11_0, 
        		"TyElement");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_12=',' 
    {
    	newLeafNode(otherlv_12, grammarAccess.getTyAccess().getCommaKeyword_3_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyAccess().getElementsTyElementParserRuleCall_3_2_1_0()); 
	    }
		lv_elements_13_0=ruleTyElement		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyRule());
	        }
       		add(
       			$current, 
       			"elements",
        		lv_elements_13_0, 
        		"TyElement");
	        afterParserOrEnumRuleCall();
	    }

)
))*	otherlv_14='}' 
    {
    	newLeafNode(otherlv_14, grammarAccess.getTyAccess().getRightCurlyBracketKeyword_3_3());
    }
))
;





// Entry rule entryRuleTyElement
entryRuleTyElement returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getTyElementRule()); }
	 iv_ruleTyElement=ruleTyElement 
	 { $current=$iv_ruleTyElement.current; } 
	 EOF 
;

// Rule TyElement
ruleTyElement returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_name_0_0=RULE_ID
		{
			newLeafNode(lv_name_0_0, grammarAccess.getTyElementAccess().getNameIDTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getTyElementRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_0_0, 
        		"ID");
	    }

)
)	otherlv_1=':' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getTyElementAccess().getColonKeyword_1());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyElementAccess().getValueTyParserRuleCall_2_0()); 
	    }
		lv_value_2_0=ruleTy		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyElementRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_2_0, 
        		"Ty");
	        afterParserOrEnumRuleCall();
	    }

)
))
;





// Entry rule entryRuleTyBind
entryRuleTyBind returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getTyBindRule()); }
	 iv_ruleTyBind=ruleTyBind 
	 { $current=$iv_ruleTyBind.current; } 
	 EOF 
;

// Rule TyBind
ruleTyBind returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getTyBindAccess().getKeyQidParserRuleCall_0_0()); 
	    }
		lv_key_0_0=ruleQid		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyBindRule());
	        }
       		set(
       			$current, 
       			"key",
        		lv_key_0_0, 
        		"Qid");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_1='=' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getTyBindAccess().getEqualsSignKeyword_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getTyBindAccess().getValueTyParserRuleCall_1_1_0()); 
	    }
		lv_value_2_0=ruleTy		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getTyBindRule());
	        }
       		set(
       			$current, 
       			"value",
        		lv_value_2_0, 
        		"Ty");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleConBind
entryRuleConBind returns [String current=null] 
	:
	{ newCompositeNode(grammarAccess.getConBindRule()); } 
	 iv_ruleConBind=ruleConBind 
	 { $current=$iv_ruleConBind.current.getText(); }  
	 EOF 
;

// Rule ConBind
ruleConBind returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
    this_CONS_0=RULE_CONS    {
		$current.merge(this_CONS_0);
    }

    { 
    newLeafNode(this_CONS_0, grammarAccess.getConBindAccess().getCONSTerminalRuleCall()); 
    }

    ;





// Entry rule entryRuleInt
entryRuleInt returns [String current=null] 
	:
	{ newCompositeNode(grammarAccess.getIntRule()); } 
	 iv_ruleInt=ruleInt 
	 { $current=$iv_ruleInt.current.getText(); }  
	 EOF 
;

// Rule Int
ruleInt returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(    this_POSINT_0=RULE_POSINT    {
		$current.merge(this_POSINT_0);
    }

    { 
    newLeafNode(this_POSINT_0, grammarAccess.getIntAccess().getPOSINTTerminalRuleCall_0()); 
    }

    |    this_NEGINT_1=RULE_NEGINT    {
		$current.merge(this_NEGINT_1);
    }

    { 
    newLeafNode(this_NEGINT_1, grammarAccess.getIntAccess().getNEGINTTerminalRuleCall_1()); 
    }
)
    ;





// Entry rule entryRuleQid
entryRuleQid returns [String current=null] 
	:
	{ newCompositeNode(grammarAccess.getQidRule()); } 
	 iv_ruleQid=ruleQid 
	 { $current=$iv_ruleQid.current.getText(); }  
	 EOF 
;

// Rule Qid
ruleQid returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
    this_ID_0=RULE_ID    {
		$current.merge(this_ID_0);
    }

    { 
    newLeafNode(this_ID_0, grammarAccess.getQidAccess().getIDTerminalRuleCall()); 
    }

    ;





RULE_CONS : 'constodo';

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_POSINT : ('0'..'9')+;

RULE_NEGINT : '~' '1'..'9' ('0'..'9')*;

RULE_ML_COMMENT : '(*' ( options {greedy=false;} : . )*'*)';

RULE_SL_COMMENT : '#' ~('\n')* '\n';

RULE_WS : (' '|'\t'|'\r'|'\n')+;



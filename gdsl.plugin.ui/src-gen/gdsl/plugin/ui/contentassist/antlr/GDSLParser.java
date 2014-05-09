/*
* generated by Xtext
*/
package gdsl.plugin.ui.contentassist.antlr;

import java.util.Collection;
import java.util.Map;
import java.util.HashMap;

import org.antlr.runtime.RecognitionException;
import org.eclipse.xtext.AbstractElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.AbstractContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.FollowElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;

import com.google.inject.Inject;

import gdsl.plugin.services.GDSLGrammarAccess;

public class GDSLParser extends AbstractContentAssistParser {
	
	@Inject
	private GDSLGrammarAccess grammarAccess;
	
	private Map<AbstractElement, String> nameMappings;
	
	@Override
	protected gdsl.plugin.ui.contentassist.antlr.internal.InternalGDSLParser createParser() {
		gdsl.plugin.ui.contentassist.antlr.internal.InternalGDSLParser result = new gdsl.plugin.ui.contentassist.antlr.internal.InternalGDSLParser(null);
		result.setGrammarAccess(grammarAccess);
		return result;
	}
	
	@Override
	protected String getRuleName(AbstractElement element) {
		if (nameMappings == null) {
			nameMappings = new HashMap<AbstractElement, String>() {
				private static final long serialVersionUID = 1L;
				{
					put(grammarAccess.getDeclAccess().getAlternatives(), "rule__Decl__Alternatives");
					put(grammarAccess.getModelAccess().getGroup(), "rule__Model__Group__0");
					put(grammarAccess.getModelAccess().getGroup_1(), "rule__Model__Group_1__0");
					put(grammarAccess.getDeclGranularityAccess().getGroup(), "rule__DeclGranularity__Group__0");
					put(grammarAccess.getDeclExportAccess().getGroup(), "rule__DeclExport__Group__0");
					put(grammarAccess.getDeclTypeAccess().getGroup(), "rule__DeclType__Group__0");
					put(grammarAccess.getDeclValAccess().getGroup(), "rule__DeclVal__Group__0");
					put(grammarAccess.getModelAccess().getDeclAssignment_0(), "rule__Model__DeclAssignment_0");
					put(grammarAccess.getModelAccess().getDeclAssignment_1_1(), "rule__Model__DeclAssignment_1_1");
					put(grammarAccess.getDeclGranularityAccess().getNameAssignment_0(), "rule__DeclGranularity__NameAssignment_0");
					put(grammarAccess.getDeclGranularityAccess().getGranularityAssignment_2(), "rule__DeclGranularity__GranularityAssignment_2");
					put(grammarAccess.getDeclExportAccess().getNameAssignment_0(), "rule__DeclExport__NameAssignment_0");
					put(grammarAccess.getDeclExportAccess().getExportsAssignment_2(), "rule__DeclExport__ExportsAssignment_2");
					put(grammarAccess.getDeclTypeAccess().getNameAssignment_1(), "rule__DeclType__NameAssignment_1");
					put(grammarAccess.getDeclValAccess().getNameAssignment_1(), "rule__DeclVal__NameAssignment_1");
					put(grammarAccess.getDeclValAccess().getAttrAssignment_2(), "rule__DeclVal__AttrAssignment_2");
					put(grammarAccess.getExportAccess().getNameAssignment(), "rule__Export__NameAssignment");
				}
			};
		}
		return nameMappings.get(element);
	}
	
	@Override
	protected Collection<FollowElement> getFollowElements(AbstractInternalContentAssistParser parser) {
		try {
			gdsl.plugin.ui.contentassist.antlr.internal.InternalGDSLParser typedParser = (gdsl.plugin.ui.contentassist.antlr.internal.InternalGDSLParser) parser;
			typedParser.entryRuleModel();
			return typedParser.getFollowElements();
		} catch(RecognitionException ex) {
			throw new RuntimeException(ex);
		}		
	}
	
	@Override
	protected String[] getInitialHiddenTokens() {
		return new String[] { "RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT" };
	}
	
	public GDSLGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}
	
	public void setGrammarAccess(GDSLGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
}

package IC.Parser;

import java_cup.runtime.Symbol;


public class Token extends Symbol {
	private int m_tag,m_line,m_column;
	private String m_value;
    public Token(int tag, int line,int column, String value) {
        super(tag, null);
        m_tag = tag;
        m_line = line;
        m_column = column;
        m_value = value;
        
        
    }
    
    public int getTag() { return m_tag;}
    public int getLine() { return m_line;}
    public int getColumn() { return m_column;}
    public String getValue() { return m_value;}
    public String toString() {return "#"+m_tag + " line#:"+m_line+" column#:"+m_column+" "+m_value;}
    
}


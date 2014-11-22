package IC;
import java.io.FileReader;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import IC.Parser.Lexer;
import IC.Parser.Token;
import IC.Parser.sym;
public class Main
{
    public static void main(String[] args)
    {
    	try
    	{
	    	PrintHeader();
	    	Iterator<Token> i = getTokens(new FileReader(args[1])).iterator();
    	
	    	while(i.hasNext())
	    	{
	    		Token current = i.next();
	    		PrintToken(current.getValue(),getTagString(current.getTag(),current.getValue()),current.getLine(),current.getColumn());
	    		
	    	}
    		
    	    
    	}
    	catch(Exception e)
    	{
    		PrintTokenError(e.toString());
    		System.exit(1);
    	}
    	
    	
    }
    
    private static String getTagString(int tag, String value)
    {
    	
    	
    }
    
    public static Collection<Token> getTokens(java.io.Reader reader)
    {
    	Token currToken;
    	LinkedList<Token> list = new LinkedList<Token>();
	    try 
	    {
	        Lexer scanner = new Lexer(reader);
	        while(sym.EOF != (currToken=scanner.next_token()).getTag() ) 
	        {
	        	list.add(currToken);
	        }
	    
	    }
	    catch (Exception e) 
	    {
	        throw new RuntimeException("IO Error (brutal exit)" + e.toString());
	    }
	    return list;
    }
    
    public static void PrintHeader()
    {
    	System.out.println("token\ttag\tline :column");
    }
    public static void PrintToken(String token,String tag , int line , int column)
    {
    	System.out.println(token+"\t"+tag+"\t"+line+":"+column);
    }
    public static void PrintTokenError(String errMsg)
    {
    	System.err.println("Error!\t"+errMsg);
    }

}



package org.jsoup.nodes;

import org.jsoup.helper.StringBuilder;

/**
 A comment node.

 @author Jonathan Hedley, jonathan@hedley.net */
class Comment extends Node {
    private static inline var COMMENT_KEY:String = "comment";

    /**
     Create a new comment node.
     @param data The contents of the comment
     @param baseUri base URI
     */
    public function new(data:String, baseUri:String) {
        super(baseUri, new Attributes());
        attributes.put(COMMENT_KEY, data);
    }

    override public function nodeName():String {
        return "#comment";
    }

    /**
     Get the contents of the comment.
     @return comment content
     */
    public function getData():String {
        return attributes.get(COMMENT_KEY);
    }

    override function outerHtmlHead(accum:StringBuilder, depth:Int, out:Document.OutputSettings):Void {
        if (out.getPrettyPrint())
            indent(accum, depth, out);
        
		accum.add("<!--");
		accum.add(getData());
        accum.add("-->");
    }

    override function outerHtmlTail(accum:StringBuilder, depth:Int, out:Document.OutputSettings):Void {}

    //@Override
    override public function toString():String {
        return outerHtml();
    }
	
	//@Override
    override public function clone():Comment {
        return cast copyTo(new Comment(null, baseUri), null);
    }
}

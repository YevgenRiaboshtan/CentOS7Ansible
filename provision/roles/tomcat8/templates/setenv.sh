#!/usr/bin/env bash
UMASK=0022
CATALINA_OPTS="-XXaltjvm=dcevm -javaagent:{{ layout.installation_dir }}/apache-tomcat-{{ tomcat8_version }}/bin/hotswap-agent.jar -Djavax.xml.parsers.SAXParserFactory=com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl -Djavax.xml.parsers.DocumentBuilderFactory=com.sun.org.apache.xerces.internal.jaxp.DocumentBuilderFactoryImpl -Djavax.xml.transform.TransformerFactory=com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl"

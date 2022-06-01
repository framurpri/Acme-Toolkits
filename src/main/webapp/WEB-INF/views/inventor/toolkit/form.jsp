<%--
- form.jsp
-
- Copyright (C) 2012-2022 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" uri="urn:jsptagdir:/WEB-INF/tags"%>

<acme:form>
	
	<jstl:if test="${command != 'create'}">
	<acme:input-money readonly= "true" code="patron.patronage.form.label.exchange" path="exchange"/>
	<acme:input-textbox readonly ="true" code="inventor.toolkit.form.label.code" path="code"/>
	<acme:input-money readonly="true" code="inventor.toolkit.form.label.totalPrice" path="totalPrice"/>
	</jstl:if>
	<acme:input-textbox code="inventor.toolkit.form.label.title" path="title"/>
	<acme:input-textarea code="inventor.toolkit.form.label.description" path="description"/>
	<acme:input-textarea code="inventor.toolkit.form.label.assemblyNotes" path="assemblyNotes"/>
	<acme:input-url code="inventor.toolkit.form.label.link" path="link"/>
	
	
    
    <jstl:choose>	 
		<jstl:when test="${command == 'show' && draftMode == false}">
			<acme:button code="inventor.toolkit.form.button.components" action="/inventor/amount/list-amount-components?masterId=${id}"/>
    		<acme:button code="inventor.toolkit.form.button.tools" action="/inventor/amount/list-amount-tools?masterId=${id}"/>		
		</jstl:when>
		<jstl:when test="${acme:anyOf(command, 'show, update, delete, publish') && draftMode == true}">
			<acme:button code="inventor.toolkit.form.button.components" action="/inventor/amount/list-amount-components?masterId=${id}"/>
			<acme:button code="inventor.toolkit.form.button.tools" action="/inventor/amount/list-amount-tools?masterId=${id}"/>
			<acme:submit code="inventor.toolkit.form.button.update" action="/inventor/toolkit/update"/>
			<acme:submit code="inventor.toolkit.form.button.delete" action="/inventor/toolkit/delete"/>
			<acme:submit code="inventor.toolkit.form.button.publish" action="/inventor/toolkit/publish"/>
		</jstl:when>
		<jstl:when test="${command == 'create'}">
			<acme:submit code="inventor.toolkit.form.button.create" action="/inventor/toolkit/create"/>
		</jstl:when>		
	</jstl:choose>
</acme:form>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>

<%@ include file="header.jsp"%>
<body>
<%@ include file="menu.jsp"%>

<div class="container-fluid">

	<div class="panel panel-default">
	  <div class="panel-heading">
	    <h3 class="panel-title"><spring:message code="current.sessions" text="Current Sessions"/></h3>
	  </div>
	  <div class="panel-body">

			<div class="tab-content">
			 	<div class="tab-pane active" id="current_sessions">
			 		<div class="row-fluid">
			 			<c:choose>
			 				<c:when test="${!currentSessions.isEmpty()}">

                                <table class="table table-striped visible-xs-block">
									<%@ include file="currentSessions_tableheader_small.html"%>
                                    <tbody class="">
										<c:forEach items="${currentSessions}" var="session">
					                        <c:url value="comments" var="url" scope="page">
					                            <c:param name="sessionId" value="${session.getId()}" />
					                        </c:url>
											<tr class="sessions" data-link="${url}">
												<td>${session.date}<br>${session.start} - ${session.end}</td>
												<td>${session.title}</td>
												<td>${session.author}</td>
												<td>${session.location}</td>
												<td><a class="btn btn-primary" href='comments?sessionId=${session.id}'>
                                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                    </a>
                                                </td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

                                <table class="table table-striped hidden-xs">
                                    <%@ include file="currentSessions_tableheader.html"%>
                                    <c:forEach items="${currentSessions}" var="session">
                                        <c:url value="comments" var="url" scope="page">
                                            <c:param name="sessionId" value="${session.getId()}" />
                                        </c:url>
                                        <tr class="sessions" data-link="${url}">
                                            <td>${session.date}</td>
                                            <td>${session.start}</td>
                                            <td>${session.end}</td>
                                            <td>${session.title}</td>
                                            <td>${session.author}</td>
                                            <td>${session.location}</td>
                                            <td>${session.type.label}</td>
                                            <td><a class="btn btn-primary" href='comments?sessionId=${session.id}'>Comment</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
								</c:when>
						<c:otherwise>
							<spring:message code="no.sessions.available" text="no.sessions.available" />
						</c:otherwise>
						</c:choose>
					</div>
			 	</div>
			</div>
		</div>
	</div>

</div>

<%@ include file="footer.html"%>

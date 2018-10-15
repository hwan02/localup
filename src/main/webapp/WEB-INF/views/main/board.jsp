<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <ul class="message-card-list"> -->
<c:forEach items="${list}" var="board">
	 <div class="col-lg-4 mb-4">
		<div class="card h-100">
			<h4 class="card-header"><a href="/board/read?board_no=${board.board_no }">${board.board_title }</a></h4>
			<div class="card-body">
				<p class="card-text">${board.board_cont}</p>
			</div>
			<div class="card-footer">
				<a href="#" class="btn btn-primary">${board.board_view}</a>
			</div>
		</div>	
	</div>	
	<%-- <li>
		<div class="message-card ">
			<div
				class="user-profile-wrap lia-user-avatar lia-avatar-editable lia-component-common-widget-user-avatar">
				<div class="user-pic avatar-wrapper">
					<div class="avatar-wrapper">
						<div class="avatar-wrapper">
							<div
								class="UserAvatar lia-user-avatar lia-component-common-widget-user-avatar">
								<!-- userÁ¤º¸ -->
								<a href="/t5/user/viewprofilepage/user-id/652600" target="_self"
									tabindex="-1" class="UserAvatar lia-link-navigation"> 
								 <img src="https://lh4.googleusercontent.com/-LsjPMPX3bv0/AAAAAAAAAAI/AAAAAAAAAAg/oVWsQVt8dG8/photo.jpg?sz=110"
									alt="AriMar" title="${board.board_title }" class="lia-user-avatar-message">
								</a>
							</div>
							<div class="rank-icon-right">
								<img
									src="https://cmxpv89733.i.lithium.com/html/rank_icons/Googler_30px.png"
									alt="Rank" title="Googler">
							</div>
						</div>
					</div>
				</div>
				<div class="user-info">
					<h5>
						<a
							href="/t5/Announcements/Why-Google-Maps-made-it-easier-to-make-plans-with-your-friends/ba-p/1084090"
							class="user-login">AriMar</a>
					</h5>
					<div class="message-time-wrap">

						<span>Oct 4, 2018</span>
					</div>
				</div>
			</div>
			<div class="message-content">
				<a
					href="/t5/Announcements/Why-Google-Maps-made-it-easier-to-make-plans-with-your-friends/ba-p/1084090"
					class="msg-content-body-img" role="img"
					style="background-image: url(&amp;quot;https://cmxpv89733.i.lithium.com/t5/image/serverpage/image-id/328813i734AEFA822755B3C/image-size/medium?v=1.0&amp;amp;px=400&amp;quot;)">
					User Inserted Image </a>
				<h4 class="message-content-subject">
					<a
						href="/t5/Announcements/Why-Google-Maps-made-it-easier-to-make-plans-with-your-friends/ba-p/1084090"
						role="tab">Why Google Maps made it easier to make plans with
						your friends</a>
				</h4>
			</div>

			<div class="message-stats-container">
				<div class="message-stats">
					<a
						href="/t5/Announcements/Why-Google-Maps-made-it-easier-to-make-plans-with-your-friends/ba-p/1084090"
						class="comment-count" title="12 comments"><span></span>12</a>
					<div class="lia-message-kudos lia-component-kudos lia-custom-kudos">
						<div
							class="KudosButton lia-button-image-kudos-wrapper lia-component-kudos-widget-button-version-2 lia-component-kudos-widget-button-horizontal lia-component-kudos-widget-button">
							<div
								class="lia-button-image-kudos lia-button-image-kudos-horizontal  lia-button-image-kudos-disabled lia-button-image-kudos-has-kudoes lia-button-image-kudos-has-kudos lia-button-image-kudos-not-kudoed lia-button">

								<div class="lia-button-image-kudos-count">
									<span title="28 likes"
										class="lia-link-navigation kudos-count-link lia-link-disabled">
										<span
										class="MessageKudosCount lia-component-kudos-widget-message-kudos-count">28</span>
										<span
										class="lia-button-image-kudos-label lia-component-kudos-widget-kudos-count-label"
										style=""></span>
									</span>
								</div>

								<div class="lia-button-image-kudos-give"
									title="Sorry, you cant give kudos to this">
									<span title="28 likes"
										class="lia-link-navigation kudos-link lia-link-disabled">
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</li> --%>
</c:forEach>
<!-- </ul> -->
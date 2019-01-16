<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width",initial-scale="1" >		
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> 
<title>PSK's SIMPLE BBS with Bootstrap</title>
</head>
<body>
	<%
		// session check -> "userID"
		String userID = null;
		if (session.getAttribute("userID") !=null){
			userID = (String) session.getAttribute("userID");
		}
	
	%>

	<nav class ="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expand="false">
				<span class ="icon-bar"></span>
				<span class ="icon-bar"></span>
				<span class ="icon-bar"></span>
			</button>
			<a class ="navbar-brand" href="main.jsp">PSK's Simple BBS</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">HOME</a></li>
				<li class ="active"><a href="#introducePSK">Who is PSK</a></li>
				<li><a href="bbs.jsp">BBS</a></li>
			</ul>
			
			<% 	
				// if not login - show login/Join
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class = "dropdown-toggle"
					data-toggle="dropdown" role ="button" 
					aria-haspopup="true"
					aria-expanded="false"><span class="glyphicon glyphicon-option-vertical"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">login</a></li>
						<li><a href="join.jsp">join</a></li>					
					</ul>
				</li>
			</ul>		
					
			<%
				}else{
				// if login - show MyPage / logout
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class = "dropdown-toggle"
					data-toggle="dropdown" 
					role ="button" 
					aria-haspopup="true"
					aria-expanded="false">My Page<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">logout</a></li>
					</ul>
				</li>
			</ul>
			
			<%
				}
			%>
			
		</div>	
	</nav>

<!-- ================== carousel ================= -->
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/c1.jpg">
					<div class="container">
              			<div class="carousel-caption text-left">
               				<h1>Hello. My name is Park Seong-Kyu. :)</h1>
                			<p>This homepage is simple BBS with Bootstrap</p>
              			</div>
            		</div>
				</div>
				<div class="item">
					<img src="images/c2.jpg">
					<div class="container">
		              <div class="carousel-caption">
		                <h1>안녕하세요. 박성규입니다. :)</h1>
		                <p>이 홈페이지는 간단한 JSP 게시판입니다.
		                <br>JSP, 부트스트랩, CSS를 이용하여 제작하였습니다. 잘 부탁드립니다.</p> 
		              </div>
         		   </div>				
				</div>
				<div class="item">
					<img src="images/c3.jpg">
					<div class="container">
		              <div class="text-right carousel-caption">
		                <h1>こんにちは。パクソンギュです。:)</h1>
		                <p>このホームページはJSPを利用した掲示板です。
		                <br>JSP,ブートストラップ,CSS を利用して製作しました。 よろしくお願いします。</p> 
		              </div>
          		 	</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	
	<!-- ================== tab ================= -->	
	<div class="container" id="introducePSK">
		<div class="row">
			<!-- Nav tabs -->
			<div class="card">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#en" aria-controls="en" role="tab" data-toggle="tab">English</a></li>
					<li role="presentation"><a href="#ko" aria-controls="ko" role="tab" data-toggle="tab">한글</a></li>
					<li role="presentation"><a href="#jp" aria-controls="jp" role="tab" data-toggle="tab">日本語</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="en">
	<!-- Marketing messaging and featurettes -->
      <div class="container marketing">
	<!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4"><img class="rounded-circle" 
          src="images/ic1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Graduate of Sejong University</h2>
            <p>2006.03.02~2014.2.21
            <br>Sejong University Department of Digital Contents(3.65/4.5)
            <br>Received internships at 'DAUM', 'EverThink', and the 'Korea Foundation for the Advancement of Science and Creativity'.
            <br>Completed the training process of Kosta's 2013 for the Interactive 3D Content Manufacturer for the 2013 Smart TV, Mobile, and Game Platform.
            <br>Engineer Information Processing / Computer Specialist in Spreadsheet & Database Level-1
            </p>
            
          </div>
          <div class="col-lg-4"><img class="rounded-circle"
          src="images/ic2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Director of Chocolatier</h2>
            <p>Chocolatier director(the highest qualification in Korea). 
            <br>I produced and sold high-quality handmade chocolate, ran chocolate shops, and lectured on many chocolites.</p>
          </div>
          <div class="col-lg-4"><img class="rounded-circle" 
            src="images/ic3.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>A year in Japan</h2>
            <p>I spent a year in Osaka, Japan as a working holiday.
            <br>I studied Japanese and worked in Don Quixote and YAMATO TRANSPORT, so I learned Japanese culture that I could not learn from books.
            <br>JLPT N1 
            <br>I'm preparing to get a job back in Japan.</p>
          </div>
        </div><!-- /.row -->
	 <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">
            		Prepared.<small class="text-muted">I'm ready. That's why it's so reliable!</small></h2>
				<p class="lead">
					I completed the training process of Kosta's 2013 for the Interactive 3D Content Manufacturer for the 2013 Smart TV, Mobile, and Game Platform.
					So I learned Java, HTML, Sevlet, JSP, JS, CSS's implementation process, MVC model-1, model-2's structure.
					Using this in 2018, I developed this simple but core web page, real-time chat web page using ajax, Android travel planner application, and prepared to quickly adapt to the current business.
				</p>
		</div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto"  src="images/f1.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 col-md-push-5">
            <h2 class="featurette-heading">
            		Sincere.<small class="text-muted">If I have a goal, do my best! So I make a result.</small ></h2>
            	<p class="lead">
            		I received second grade scholarship in 2011 with the goal of studying hard at university after I was discharged from military.
            		I took a step forward by acquiring the Computer Specialist in Spreadsheet & Database Level-1 Engineer and Information Processing.
					"Yoga Couch," an app created by a small startup company that interned, won the bronze medal at the 2nd Korea App Creation Contest and was ranked first in App Store Health at that time.
					 I've experienced this kind of hard work and good results. 
					 I started Chocolatier as a small hobby, I even acquired the best qualified director of in Korea.
					 I made, sold, and lectured high-quality handmade chocolate and produced the chocolatier.
					 My name, Park Sung-kyu, means "sincerity". I will do my best even with a small goal that suits my name.
            	</p>
          </div>
          <div class="col-md-5 col-md-pull-7">
            <img class="featurette-image img-fluid mx-auto" src="images/f2.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">
            	Kindly. <small class="text-muted">If not happy, It's not PSK! We can do difficult things together.</small></h2>
            	<p class="lead">
            		I went to Japan to study chocolate and Japanese.
            		Contrary to the idea, the reality was harsh. But I didn't give up. I was thankful that I could learn new things at many years of age.
            	 	The hardest thing in Japan was Yamato courier. But it was also the most enjoyable. It was hard to learn Japanese and hard work, But I enjoyed the hard work because I enjoyed working with my co-workers.
            	 	Customers were proud to see me change from worry to trust.      		
            		I changed through a broader perspective and challenges in Japanese life. After returning to Korea, I've wanted to be a new dream 'global computer programmer'.       
            	</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="images/f3.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">
        <!-- Jumnbotron -->
		<div class="container">
			<div class="jumbotron" id="main_jumbotron">
				<div class="container">
					<p id="J_title">Nothing is late.</p>
					<p id="J_contents">
						it was too late to see the light,<br>
						looked out the window<br>
						Darkness was pouring in<br>
						I thought it was late.<br>
						I Thought of it<br>
						The moonlight is starting now.</p>
					<h3>Without feeling late. With a steady effort.
					<br>I want to be a programmer who becomes the moonlight to someone.
					</h3>
				</div>
			</div>
		</div>
        <!-- /END THE FEATURETTES -->
      </div><!-- /.container -->
						</div>
					<div role="tabpanel" class="tab-pane" id="ko">
	
	
	<!-- Marketing messaging and featurettes -->
      <div class="container marketing">
	<!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4"><img class="rounded-circle" 
          src="images/ic1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>세종대 졸업</h2>
            <p>2006.03.02~2014.2.21
            <br>세종대학교 컴퓨터공학부 디지털콘텐츠학과 (3.65/4.5)
            <br>'다음', '에버씽크', '한국과학창의재단' 인턴
            <br>Kosta 2013 스마트TV.모바일.게임 플랫폼을 위한 인터렉티브 3D 컨텐츠 제작사 양성과정 수료
            <br>정보처리기사 / 컴퓨터활용능력 1급 보유
            </p>
            
          </div>
          <div class="col-lg-4"><img class="rounded-circle"
          src="images/ic2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>쇼콜라티에 디렉터</h2>
            <p>한국 쇼콜라티에 '최고자격'인 디렉터 과정 수료.
            <br>1년간 쇼콜라티에로서 활동. 
            <br>고급 수제 초콜릿 제작, 판매, 매장운영. 강의를 하며 쇼콜라티에 양성.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
          <div class="col-lg-4"><img class="rounded-circle" 
            src="images/ic3.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>일본에서의 1년</h2>
            <p>워킹홀리데이로 일본 오사카에서 1년동안 생활. 
            <br>일본어 공부 뿐 아니라, 돈키호테, 야마토 운수 등에서 일하면서 현지 문화를 몸소 익힘.
            <br>JLPT N1급 취득.
            <br>현재, 일본으로 취업을 준비.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
        </div><!-- /.row -->
	 <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">
            		Prepared.<small class="text-muted">준비되어 있는 그래서 '믿음'직스러운!</small></h2>
				<p class="lead">
					Kosta 교육 '2013 스마트TV.모바일.게임 플랫폼을 위한 인터렉티브 3D 컨텐츠 제작사 양성과정'을 수료하며
					java, HTML, Sevlet, JSP, JS, CSS의 구현과정, MVC의 model-1, model-2의 구조를 익혔습니다.
					2018년 다시금 이를 이용하여 간단하지만 핵심구조로 짜여져 있는 이 웹페이지와 ajax를 이용한 실시간 채팅 웹페이지, Android 여행플래너 Application을 독학으로 개발하며
					현업에 빠르게 적응할 수 있도록 준비했습니다.
				</p>
		</div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto"  src="images/f1.jpg" width="400">
          </div>     
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 col-md-push-5">
            <h2 class="featurette-heading">
            		Sincere.<small class="text-muted">목표가 있으면 성실하게! 그래서 '결과'를 내는</small ></h2>
            	<p class="lead">
					군 전역 후 학업에 열중 해 보자는 목표에 2011학년도 성적 2위 장학금을 받은 적이 있습니다. 자격증으로 정보처리기사, 컴퓨터활용능력 1급을 취득하며 한 발짝 한 발짝  나아갔습니다.
					인턴으로 있었던 작은 스타트업 회사에서 만든 앱 '요가코치'는 제 2회 대한민국 앱 창작대회에서 동상을 수상, 당시 앱스토어 헬스분야 1위를 하기도 했습니다. 이렇게 정성을 다해 나간다면
					좋은 결과를 얻는 다는 것을 경험하였습니다. 작은 취미로 시작한 쇼콜라티에는 대한민국 최고자격인 디렉터까지 취득하여 높은 수준의 수제 초콜릿을 제작, 판매, 강의도 하여 쇼콜라티에를 배출하기도 했습니다.
					제 이름 박성규의 성(誠)자는 '정성'이라는 의미를 갖고 있습니다. 이름에 걸맞는 작은 목표에도 최선을 다하는 그런 사원이 되겠습니다.
            	</p>
          </div>
          <div class="col-md-5 col-md-pull-7">
            <img class="featurette-image img-fluid mx-auto" src="images/f2.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">
            	Kindly. <small class="text-muted">즐겁지 않으면 성규가 아니다! 어려운 일도 함께 한다면 즐겁게 해낼 수 있다.</small></h2>
            	<p class="lead">
					초콜릿과 일본어를 공부하고 싶어 찾아간 일본. 이상과 달리 현실은 가혹했습니다. 하지만 저는 포기하지 않았습니다. 적지 않은 나이에 새로운 것을 배울 수 있다는 것에 감사했습니다. 
            	 	일본에서 가장 힘들었었던 일은 야마토 운수였습니다.하지만 가장 즐겁기도 했습니다. 미숙한 일본어와 고된 일이 힘들었지만, 열심히 임하는 자세에 함께 해주는 동료들이 있어 점점 익숙해 졌습니다.
            	 	손님들도 걱정에서 믿음으로 모습이 바뀌어 뿌듯했습니다.
            		귀국 후, "글로벌한 프로그래머" 새로운 꿈이 생겼습니다. 넓어진 시야와 일본 생활 도전을 통해 바뀐 나, 이렇게 세상에 다시 도전합니다.
            	</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="images/f3.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">
        <!-- Jumnbotron -->
		<div class="container">
			<div class="jumbotron" id="main_jumbotron">
				<div class="container">
					<p id="J_title">아무것도 늦지 않았다.</p>
					<p id="J_contents">
						빛을 보기엔 늦었다길래<br>
						창밖을 보니<br>
						어둠이 몰려오고 있었다.<br>
						늦었구나 생각했는데<br>
						생각해보니<br>
						달빛은 이제 시작이구나.</p>
					<h3>늦었다 생각하지 않고 끊임없이 도전하여<br> 누군가에게는 달빛이 되는 그런 프로그래머가 되고 싶습니다.	</h3>
				</div>
			</div>
		</div>
        <!-- /END THE FEATURETTES -->
      </div><!-- /.container -->
						
						</div>
					<div role="tabpanel" class="tab-pane" id="jp">

		<!-- Marketing messaging and featurettes -->
      	<div class="container marketing">
		<!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4"><img class="rounded-circle" 
          src="images/ic1.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>世宗大卒業</h2>
            <p>2006.03.02~2014.2.21
            <br>世宗大学コンピューター工学部デジタルコンテンツ学科 (3.65/4.5)
            <br>'DAUM','EverThink','韓国科学創意財団'でインターン
            <br>Kosta 2013 スマートテレビ。モバイル·ゲームプラットフォームのためのインタラクティブ3Dコンテンツ製作会社養成課程修了
            <br>情報処理技師/コンピュータ活用能力1級保有
            </p>
            
          </div>
          <div class="col-lg-4"><img class="rounded-circle"
          src="images/ic2.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>ショコラティエ</h2>
            <p>韓国のショコラティエの最高資格であるディレクター資格取得
            <br>一年間 ショコラティエとして活動. 
            <br>高級手作りチョコレートを製作、販売はもちろん、チョコレート売場も運営、講義も行い、様々なショコラティエを養成</p>
          </div>
          <div class="col-lg-4"><img class="rounded-circle" 
            src="images/ic3.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>日本での1年</h2>
            <p>憧れていた日本の大阪で1年間ワ－キングホリデー
            <br>日本語を勉強し、ドンキホーテ、ヤマト運輸などで働きながら、
            <br>本では学ぶことのできない日本現地の文化を習
            <br>JLPTN1級取得
            <br>再び日本での就職を準備</p>
          </div>
        </div><!-- /.row -->
	 <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">
            		Prepared.<small class="text-muted">用意されているので心強い!</small></h2>
				<p class="lead">
					Kosta教育 2013 スマートテレビ。モバイル·ゲームプラットフォームのためのインタラクティブ3Dコンテンツ製作会社養成課程を修了し,
					java, HTML, Sevlet, JSP, JS, CSSの具現過程, MVC model-1, model-2の 仕組みを勉強しました。
					2018年,再びこれを利用して簡単ですが,核心構造になっているこのウェブページとajaxを利用したリアルタイムチャットウェブページ,Android 旅行プランナーApplicationを独学で開発し,現場に早く適応できるように準備しました。
				</p>
		</div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto"  src="images/f1.jpg" width="400">
          </div>     
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 col-md-push-5">
            <h2 class="featurette-heading">
            		Sincere.<small class="text-muted">目標があれば真面目に! それで'結果'を出す</small ></h2>
            	<p class="lead">
					"軍除隊後,学業に熱中してみようとの目標に,11学年度の成績2位の奨学金を受けたことがあります。 
					資格証で情報処理技師,コンピューター活用能力1級を取得しながら,一歩一歩進んでいきました。
					インターンだった小さなスタートアップ会社で作ったアプリ"ヨガコーチ"は第2回大韓民国アプリ創作大会で銅賞を受賞し, 当時アプリストアヘルス分野1位をしたこともあります。 
					このように精魂込めて出るなら良い結果を得ることを経験しました。
					小さい趣味で始まった"ショコラティエ"は,韓国の最高資格であるディレクターまで取得し,高いレベルの手作りチョコレートを制作,販売,講義を行い,ショコラティエを輩出しました。
					私の名前パク·ソンギュ(朴誠珪)の"誠"は"真心"という意味を持っています。 名前にふさわしい小さな目標にも最善をつくすそんな社員になりたいです。
            	</p>
          </div>
          <div class="col-md-5 col-md-pull-7">
            <img class="featurette-image img-fluid mx-auto" src="images/f2.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">
            	Kindly. <small class="text-muted">楽しくなければソンギュではない! 難しい仕事も一緒にすれば楽しくできる。</small></h2>
            	<p class="lead">
            		チョコレートと日本語を学びたくて訪ねた日本。以上と違って現実は厳しかったです。             		
 					しかし,私はあきらめませんでした。 少なくない歳に新しいことを学ぶことができるということに感謝しました。
            	 	日本で一番大変だった事はヤマト運輸でした。でも一番楽しかったりもしました。下手な日本語とつらいことが大変でしたが、親切な仲間と一緒にしていたら大変なことも楽しかったです。
            	 	お客さんも心配から信じてくれる姿に変わって行ってやりがいもありました。      		
            		帰国後,新しい夢の"グローバルなプログラマー"が目標になりました。広くなった視野と日本生活の挑戦を通じて変わった私,こうして世の中にまた挑戦します。
            	</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="images/f3.jpg" width="400">
          </div>
        </div>

        <hr class="featurette-divider">
        <!-- Jumnbotron -->
		<div class="container">
			<div class="jumbotron" id="main_jumbotron">
				<div class="container">
					<p id="J_title">まだ手遅れない</p>
					<p id="J_contents">
						 光を見るには遅いと言うから<br>
						窓の外を見ると<br>
						闇が押し寄せて来ていた<br><br>
						遅かったのだなと思ったが<br>
						考えて見れば<br>
						月光は今からだな。</p>
					<h3>遅いと思わず絶えず挑戦し<br>誰かにとって月光になれるプログラマになりたいです。	</h3>
				</div>
			</div>
		</div>
        <!-- /END THE FEATURETTES -->
      </div><!-- /.container -->
						
						
					</div>
				</div>
			</div>
		</div>
	</div>

	
	 <!-- FOOTER -->
     <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy; 2018 Park SeongKyu &middot; <a href="https://github.com/parkgyu7">Github</a> &middot; <a href="https://psklog.tistory.com/">Blog</a></p>
      </footer>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	</body>
</html>



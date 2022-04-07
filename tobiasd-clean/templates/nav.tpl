<nav class="navbar navbar-default navbar-fixed-top" role="menubar">
	<div class="hidden-sm hidden-xs">{{$langselector}}</div>

	<div class="navbar-header">
	    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
	        <span class="sr-only">Toggle navigation"</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	    </button>
	    <a class="navbar-brand" href="#">{{$banner}} {{$sitelocation}}</a>
	</div>

	<div class="collapse navbar-collapse navbar-ex1-collapse">
	    <ul class="nav navbar-nav">
		{{if $userinfo}}
			<!-- drop down menu //-->
            <li aria-hidden="true" class="dropdown hidden-xs hidden-sm">
				<a href="#" accesskey="u" class="dropdown-toggle nav-menu-icon" data-toggle="dropdown"><img src="{{$userinfo.icon}}" alt="{{$userinfo.name}}"><b class="caret"></b></a>
                <ul role="menu" aria-haspopup="true" class="dropdown-menu">
                {{foreach $nav.usermenu as $usermenu}}
                    <li role="menuitem"><a class="{{$usermenu.2}}" href="{{$usermenu.0}}" title="{{$usermenu.3}}"><i class="hidden-sm hidden-xs shashape {{$usermenu.2}}"></i> {{$usermenu.1}}</a></li>
                {{/foreach}}
					
					<li class="divider"></li>
                    {{if $nav.notifications}}<li role="menuitem"><a class="{{$nav.notifications.2}}" href="{{$nav.notifications.0}}" title="{{$nav.notifications.3}}" ><i class="hidden-sm hidden-xs shashape notifications"></i> {{$nav.notifications.1}}</a></li>{{/if}}
                    {{if $nav.messages}}<li role="menuitem"><a class="{{$nav.messages.2}}" href="{{$nav.messages.0}}" title="{{$nav.messages.3}}" ><i class="hidden-sm hidden-xs shashape message"></i> {{$nav.messages.1}}</a></li>{{/if}}
					<li class="divider"></li>
                    {{if $nav.contacts}}<li role="menuitem"><a class="{{$nav.contacts.2}}" href="{{$nav.contacts.0}}" title="{{$nav.contacts.3}}" ><i class="hidden-sm hidden-xs shashape friends"></i> {{$nav.contacts.1}}</a></li>{{/if}}	
                    {{if $nav.manage}}<li role="menuitem" class="hidden-sm"><a class="{{$nav.manage.2}}" href="{{$nav.manage.0}}" title="{{$nav.manage.3}}"><i class="hidden-sm hidden-xs shashape signature"></i> {{$nav.manage.1}}</a></li>{{/if}}				
					<li class="divider"></li>

                    {{if $nav.settings}}<li role="menuitem" class="hidden-sm"><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}" title="{{$nav.settings.3}}"><i class="hidden-sm hidden-xs shashape settings"></i> {{$nav.settings.1}}</a></li>{{/if}}
                    {{if $nav.admin}}<li role="menuitem" class="hidden-sm"><a accesskey="a" class="{{$nav.admin.2}}" href="{{$nav.admin.0}}" title="{{$nav.admin.3}}" ><i class="hidden-sm hidden-xs shashape admin"></i> {{$nav.admin.1}}</a></li>{{/if}}
					<li class="divider"></li>
                    {{if $nav.logout}}<li role="menuitem"><a class="menu-sep {{$nav.logout.2}}" href="{{$nav.logout.0}}" title="{{$nav.logout.3}}" ><i class="hidden-sm hidden-xs shashape logout"></i> {{$nav.logout.1}}</a></li>{{/if}}
                </ul>
             </li>
		{{/if}}
		<!-- Navigation Panel //-->
		{{if $nav.notifications}}
		    <li id="nav-notifications-linkmenu" class="nav-menu-icon hidden-xs"><a href="{{$nav.notifications.0}}" rel="#nav-notifications-menu" title="{{$nav.notifications.1}}"><span class="glyphicon glyphicon-tasks"></a>
			<span id="notify-update" class="nav-notify"></span>
			<ul id="nav-notifications-menu" class="menu-popup">
				<li role="menuitem" id="nav-notifications-mark-all"><a onclick="notifyMarkAll(); return false;">{{$nav.notifications.mark.1}}</a></li>
				<li role="menuitem" id="nav-notifications-see-all"><a href="{{$nav.notifications.all.0}}">{{$nav.notifications.all.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
		    </li>		
		{{/if}}		
		{{if $nav.community}}
			<li id="nav-community-link" class="nav-menu {{$sel.community}}">
				<a class="{{$nav.community.2}}" href="{{$nav.community.0}}" title="{{$nav.community.3}}" ><i class="hidden-sm hidden-xs shashape community"></i> {{$nav.community.1}}</a>
			</li>
		{{/if}}
		
		{{if $nav.network}}
			<li role="menuitem" id="nav-network-link" class="nav-menu {{$sel.network}}">
				<a accesskey="n" class="{{$nav.network.2}}" href="{{$nav.network.0}}" title="{{$nav.network.3}}" ><i class="hidden-sm hidden-xs shashape network"></i> {{$nav.network.1}}</a>
				<span id="net-update" class="nav-notify"></span>
			</li>
		{{/if}}
		{{if $nav.home}}
			<li role="menuitem" id="nav-home-link" class="nav-menu {{$sel.home}}">
				<a accesskey="p" class="{{$nav.home.2}}" href="{{$nav.home.0}}" title="{{$nav.home.3}}" ><i class="hidden-sm hidden-xs shashape home"></i> {{$nav.home.1}}</a> <span id="home-update" class="nav-notify"></span>
			</li>
		{{/if}}
		{{if $nav.notifications}}<li role="menuitem" class="visible-sm visible-xs nav-menu"><a accesskey="f" class="{{$nav.notifications.2}}" href="{{$nav.notifications.0}}" title="{{$nav.notifications.3}}" >{{$nav.notifications.1}}</a></li>{{/if}}
                {{if $nav.contacts}}<li role="menuitem" class="visible-sm visible-xs nav-menu"><a class="{{$nav.contacts.2}}" href="{{$nav.contacts.0}}" title="{{$nav.contacts.3}}" ><i class="hidden-sm hidden-xs shashape friends"></i> {{$nav.contacts.1}}</a></li>{{/if}}	
                {{if $nav.messages}}<li role="menuitem" class="visible-sm visible-xs nav-menu"><a class="{{$nav.messages.2}}" href="{{$nav.messages.0}}" title="{{$nav.messages.3}}" ><i class="hidden-sm hidden-xs shashape messages"></i> {{$nav.messages.1}}</a></li>{{/if}}
                {{if $nav.settings}}<li role="menuitem" class="visible-sm visible-xs nav-menu"><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}" title="{{$nav.settings.3}}"><i class="hidden-sm hidden-xs shashape settings"></i> {{$nav.settings.1}}</a></li>{{/if}}
                {{if $nav.logout}}<li role="menuitem" id="nav-logout-link" class="nav-menu"><a class="{{$nav.logout.2}}" href="{{$nav.logout.0}}" title="{{$nav.logout.3}}" ><i class="hidden-sm hidden-xs shashape logout"></i> {{$nav.logout.1}}</a></li>{{/if}}
                {{if $nav.login}}<li role="menuitem" id="nav-login-link" class="nav-menu"><a class="{{$nav.login.2}}" href="{{$nav.login.0}}" title="{{$nav.login.3}}" ><i class="hidden-sm hidden-xs shashape login"></i> {{$nav.login.1}}</a><li>{{/if}}
		{{if $nav.help}} 
		<li role="menuitem" id="nav-help-link" class="nav-menu {{$sel.help}}">
			<a class="{{$nav.help.2}}" target="friendica-help" href="{{$nav.help.0}}" title="{{$nav.help.3}}" ><i class="hidden-sm hidden-xs shashape help"></i> {{$nav.help.1}}</a>
		</li>
		{{/if}}

		{{if $nav.search}}<li role="menuitem" id="nav-search-link" class="nav-menu {{$sel.search}}">
			<a accesskey="s" class="{{$nav.search.2}}" href="{{$nav.search.0}}" title="{{$nav.search.3}}" ><i class="hidden-sm hidden-xs shashape search"></i> {{$nav.search.1}}</a>
		</li>{{/if}}
		<li role="menuitem" id="nav-directory-link" class="nav-menu {{$sel.directory}}">
			<a class="{{$nav.directory.2}}" href="{{$nav.directory.0}}" title="{{$nav.directory.3}}" ><i class="hidden-sm hidden-xs shashape iglu"></i> {{$nav.directory.1}}</a>
		</li>
		
		{{if $nav.apps}}
			<li role="menu" aria-haspopup="true" id="nav-apps-link" class="nav-menu {{$sel.apps}} hidden-sm hidden-xs">
				<a class=" {{$nav.apps.2}}" href="#" rel="#nav-apps-menu" title="{{$nav.apps.3}}" >{{$nav.apps.1}}</a>
				<ul id="nav-apps-menu" class="menu-popup">
					{{foreach $apps as $ap}}
					<li role="menuitem">{{$ap}}</li>
					{{/foreach}}
				</ul>
			</li>
                    </ul>
		{{/if}}
	    </ul>
	</div>
</nav>
<ul id="nav-notifications-template" style="display:none;" rel="template">
	<li><a href="{0}"><img data-src="{1}">{2} <span class="notif-when">{3}</span></a></li>
</ul>

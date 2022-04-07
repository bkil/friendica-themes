    <nav>
        <ul>
            {{if $nav.home}}
                <li id="nav-home-link" >
                    <a id="nav-home-link" class="nav-commlink {{$nav.home.2}}
                    {{$sel.home}}" href="{{$nav.home.0}}" title="{{$nav.home.3}}" ><span class="navicon">+</span></a>
                    <span id="home-update" class="nav-notify"></span>
                </li>
            {{/if}}
            {{if $nav.notifications}}
                <li id="nav-notifications-linkmenu"><a href="{{$nav.notifications.0}}" rel="#nav-notifications-menu" title="{{$nav.notifications.1}}"><span class="navicon">&oacute;</span></a>
                    <span id="notify-update" class="nav-notify"></span>
				<ul id="nav-notifications-menu" class="menu-popup">
					<!-- TODO: better icons! -->
					<li id="nav-notifications-mark-all" class="toolbar"><a href="#" onclick="notifyMarkAll(); return false;" title="{{$nav.notifications.mark.1}}"><span class="icon s10 edit"></span></a></a><a href="{{$nav.notifications.all.0}}" title="{{$nav.notifications.all.1}}"><span class="icon s10 plugin"></span></a></li>
					<li class="empty">{{$emptynotifications}}</li>
				</ul>
                </li>		
            {{/if}}
            {{if $nav.network}}
                <li>
                    <a href="{{$nav.network.0}}" title="{{$nav.network.3}}" ><span class="navicon">T</span></a>
                    <span id="net-update" class="nav-notify"></span>
                </li>
            {{/if}}
            <li><a href="{{$nav.directory.0}}" title="{{$nav.directory.3}}"><span class="navicon">,</span></a></li>
            {{if $nav.settings}}
            <li id="nav-site-linkmenu"><a href="#" rel="#nav-site-menu"><span class="navicon">@</span></a>
                <ul id="nav-site-menu" class="menu-popup">
                    {{if $nav.manage}}<li><a class="{{$nav.manage.2}}" href="{{$nav.manage.0}}" title="{{$nav.manage.3}}">{{$nav.manage.1}}</a></li>{{/if}}				
                    {{if $nav.settings}}
                        <li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}" title="{{$nav.settings.3}}">{{$nav.settings.1}}</a></li>
                        <li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}/features" title="{{$nav.settings.3}}">Additional features</a></li>
                        <li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}/display" title="{{$nav.settings.3}}">Display settings</a></li>
                        <li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}/connectors" title="{{$nav.settings.3}}">Connector settings</a></li>
                        <li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}/addon" title="{{$nav.settings.3}}">Plugin settings</a></li>
                    {{/if}}
                    {{if $nav.admin}}<li><a class="{{$nav.admin.2}}" href="{{$nav.admin.0}}" title="{{$nav.admin.3}}" >{{$nav.admin.1}}</a></li>{{/if}}
                </ul>
            </li>
            {{/if}}
            {{if $nav.contacts}}<li><a class="{{$nav.contacts.2}}" href="{{$nav.contacts.0}}" title="{{$nav.contacts.3}}" ><span class="navicon">.</span></a></li>{{/if}}	
            {{if $nav.messages}}<li><a href="{{$nav.messages.0}}" title="{{$nav.messages.3}}"><span class="navicon">%</span></a></li>{{/if}}
            {{if $nav.logout}}<li><a href="{{$nav.logout.0}}" title="{{$nav.logout.3}}"><span class="navicon">E</span></a></li>{{/if}}
            {{if $nav.login}}<li><a href="{{$nav.login.0}}" title="{{$nav.login.3}}"><span class="navicon">@</span></a><li>{{/if}}
        </ul>
    </nav>

<ul id="nav-notifications-template" style="display:none;" rel="template">
	<li><a href="{0}"><img data-src="{1}">{2} <span class="notif-when">{3}</span></a></li>
</ul>

<div style="position: fixed; top: 3px; left: 5px; z-index:9999">{{$langselector}}</div>
{{$langselector}}

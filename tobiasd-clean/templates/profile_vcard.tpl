<div class="vcard">

	<div class="tool">
		<div class="fn label">{{$profile.name}}</div>
		{{if $profile.edit}}
			<div class="action">
			<a class="icon s16 edit ttright" href="#" rel="#profiles-menu" alt="{{$profile.edit.3}}" title="{{$profile.edit.3}}"><span>{{$profile.edit.1}}</span></a>
			<ul id="profiles-menu" class="menu-popup-left">
			{{if $profile.menu.entries}}
				{{foreach $profile.menu.entries as $e}}
				<li>
					<a href="profiles/{{$e.id}}"><img src='{{$e.photo}}' alt="{{$e.profile_name}}">{{$e.profile_name}}</a>
				</li>
				{{/foreach}}
			{{else}}
				<li>
					<a href="{{$profile.edit.0}}">{{$profile.edit.1}}</a>
				</li>
			{{/if}}
				<li><a href="profile_photo" >{{$profile.menu.chg_photo}}</a></li>
				{{if $profile.menu.cr_new }}
				<li><a href="profiles/new" id="profile-listing-new-link">{{$profile.menu.cr_new}}</a></li>
				{{/if}}
			</ul>
			</div>
		{{/if}}
	</div>

	{{if $profile.addr}}<div class="p-addr">{{$profile.addr}}</div>{{/if}}

	{{if $pdesc}}<div class="title">{{$profile.pdesc}}</div>{{/if}}
	<div id="profile-photo-wrapper"><a href="{{$profile.url}}"><img class="photo" width="175" height="175" src="{{$profile.photo}}?rev={{$profile.picdate}}" alt="{{$profile.name}}" /></a></div>

	{{if $account_type}}<div class="account-type">{{$account_type}}</div>{{/if}}

	{{if $profile.network_name}}<dl class="network"><dt class="network-label">{{$network}}</dt><dd class="x-network">{{$profile.network_name}}</dd></dl>{{/if}}

	{{if $location}}
		<dl class="location"><dt class="location-label">{{$location}}</dt> 
		<dd class="adr">
			{{if $profile.address}}<div class="street-address">{{$profile.address}}</div>{{/if}}
			<span class="city-state-zip">
				<span class="locality">{{$profile.locality}}</span>{{if $profile.locality}}, {{/if}}
				<span class="region">{{$profile.region}}</span>
				<span class="postal-code">{{$profile.postal_code}}</span>
			</span>
			{{if $profile.country_name}}<span class="country-name">{{$profile.country_name}}</span>{{/if}}
		</dd>
		</dl>
	{{/if}}
	{{if $profile.xmpp}}
 		<dl class="xmpp">
 		<dt class="xmpp-label">{{$xmpp}}</dt>
 		<dd class="xmpp-data">{{$profile.xmpp}}</dd>
 		</dl>
 	{{/if}}
	{{if $gender}}<dl class="mf"><dt class="gender-label">{{$gender}}</dt> <dd class="x-gender">{{$profile.gender}}</dd></dl>{{/if}}
	
	{{if $profile.pubkey}}<div class="key" style="display:none;">{{$profile.pubkey}}</div>{{/if}}

	{{if $marital}}<dl class="marital"><dt class="marital-label"><span class="heart">&hearts;</span>{{$marital}}</dt><dd class="marital-text">{{$profile.marital}}</dd></dl>{{/if}}

	{{if $homepage}}<dl class="homepage"><dt
        class="homepage-label">{{$homepage}}</dt><dd class="homepage-url"><a
        href="{{$profile.homepage}}" target="external-link">{{$profile.homepage}}</a></dd></dl>{{/if}}

	{{if $about}}<dl class="about"><dt class="about-label">{{$about}}</dt><dd class="x-network">{{$profile.about}}</dd></dl>{{/if}}

	{{include file="diaspora_vcard.tpl"}}
	
	<div id="profile-extra-links">
		<ul>
			{{if $connect}}
                                {{if $remoteconnect}}
                                        <li><a id="dfrn-request-link" href="{{$remoteconnect}}">{{$connect}}</a></li>
                                {{else}}
                                        <li><a id="dfrn-request-link" href="dfrn_request/{{$profile.nickname}}">{{$connect}}</a></li>
                                {{/if}}
                        {{/if}}
			{{if $wallmessage}}
				<li><a id="wallmessage-link" href="wallmessage/{{$profile.nickname}}">{{$wallmessage}}</a></li>
			{{/if}}
			{{if $subscribe_feed}}
				<li><a id="subscribe-feed-link" href="dfrn_poll/{{$profile.nickname}}">{{$subscribe_feed}}</a></li>
			{{/if}}
		</ul>
	</div>
</div>

{{$contact_block}}



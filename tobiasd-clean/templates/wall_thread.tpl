{{if $mode == display}}
{{else}}
{{if $item.comment_firstcollapsed}}
	<div class="hide-comments-outer">
		<span id="hide-comments-total-{{$item.id}}" 
			class="hide-comments-total">{{$item.num_comments}}</span>
			<span id="hide-comments-{{$item.id}}" 
				class="hide-comments fakelink" 
				onclick="showHideComments({{$item.id}});">{{$item.hide_text}}</span>
			{{if $item.thread_level==3}} - 
			<span id="hide-thread-{{$item}}-id"
				class="fakelink"
				onclick="showThread({{$item.id}});">expand</span> /
			<span id="hide-thread-{{$item}}-id"
				class="fakelink"
				onclick="hideThread({{$item.id}});">collapse</span> thread{{/if}}
	</div>
	<div id="collapsed-comments-{{$item.id}}" class="collapsed-comments" style="display: none;">
{{/if}}
{{/if}}

{{if $item.thread_level!=1}}<div class="children">{{/if}}

<div class="wall-item-decor">
	<span class="icon s22 star {{$item.isstarred}}" id="starred-{{$item.id}}" alt="{{$item.star.starred}}" title="{{$item.star.starred}}">{{$item.star.starred}}</span>
	{{if $item.lock}}<span class="navicon lock fakelink" onclick="lockview(event,{{$item.id}});" alt="{{$item.lock}}" title="{{$item.lock}}"><i class="shashape lock-closed icon-big"></i></span>{{/if}}	
	<img id="like-rotator-{{$item.id}}" class="like-rotator" src="images/rotator.gif" alt="{{$item.wait}}" title="{{$item.wait}}" style="display: none;" />
</div>

<div class="wall-item-container {{$item.indent}} {{$item.shiny}}" id="item-{{$item.guid}}">
	<div class="wall-item-item">
		<div class="wall-item-info">
			<div class="contact-photo-wrapper mframe{{if $item.owner_url}} wwfrom{{/if}}"
				onmouseover="if (typeof t{{$item.id}} != 'undefined') clearTimeout(t{{$item.id}}); openMenu('wall-item-photo-menu-button-{{$item.id}}')" 
				onmouseout="t{{$item.id}}=setTimeout('closeMenu(\'wall-item-photo-menu-button-{{$item.id}}\'); closeMenu(\'wall-item-photo-menu-{{$item.id}}\');',200)">
				<a href="{{$item.profile_url}}" target="redir" alt="{{$item.linktitle}}" title="{{$item.linktitle}}" class="contact-photo-link" id="wall-item-photo-link-{{$item.id}}">
					<img src="{{$item.thumb}}" class="contact-photo {{$item.sparkle}}" id="wall-item-photo-{{$item.id}}" alt="{{$item.name}}" />
				</a>
				<a href="#" rel="#wall-item-photo-menu-{{$item.id}}" class="contact-photo-menu-button icon s16 menu" id="wall-item-photo-menu-button-{{$item.id}}">menu</a>
				<ul class="contact-menu menu-popup" id="wall-item-photo-menu-{{$item.id}}">
				{{$item.item_photo_menu}}
				</ul>
				
			</div>	
			{{if $item.owner_url}}
			<div class="contact-photo-wrapper mframe wwto" id="wall-item-ownerphoto-wrapper-{{$item.id}}" >
				<a href="{{$item.owner_url}}" target="redir" alt="{{$item.olinktitle}}" title="{{$item.olinktitle}}" class="contact-photo-link" id="wall-item-ownerphoto-link-{{$item.id}}">
					<img src="{{$item.owner_photo}}" class="contact-photo {{$item.osparkle}}" id="wall-item-ownerphoto-{{$item.id}}" alt="{{$item.owner_name}}" />
				</a>
			</div>
			{{/if}}			
			<div class="wall-item-location">{{$item.location}}</div>	
			<div
			class="wall-item-network">{{$item.network_name}}</div>
		</div>
		<div class="wall-item-content">
			{{if $item.title}}<h2><a href="{{$item.plink.href}}" class="{{$item.sparkle}}">{{$item.title}}</a></h2>{{/if}}
			{{$item.body}}
		</div>
	</div>
	<div class="wall-item-bottom">
		<div class="wall-item-links">
		</div>
		<div class="wall-item-tags">
			{{foreach $item.hashtags as $tag}}
				<span class='tag'>{{$tag}}</span>
			{{/foreach}}
  			{{foreach $item.mentions as $tag}}
				<span class='mention'>{{$tag}}</span>
			{{/foreach}}
               {{foreach $item.folders as $cat}}
                    <span class='folder'>{{$cat.name}}</a>{{if $cat.removeurl}} (<a href="{{$cat.removeurl}}" alt="{{$remove}}" title="{{$remove}}">x</a>) {{/if}} </span>
               {{/foreach}}
                {{foreach $item.categories as $cat}}
                    <span class='category'>{{$cat.name}}</a>{{if $cat.removeurl}} (<a href="{{$cat.removeurl}}" alt="{{$remove}}" title="{{$remove}}">x</a>) {{/if}} </span>
                {{/foreach}}
		</div>
                {{if $item.edited}}<div class="itemedited">{{$item.edited['label']}} (<span title="{{$item.edited['date']}}">{{$item.edited['relative']}}</span>)</div>{{/if}}
	</div>	
	<div class="wall-item-bottom">
		<div class="wall-item-links">
			{{if $item.plink}}<a class="navicon link{{$item.sparkle}}" alt="{{$item.plink.title}}" title="{{$item.plink.title}}" href="{{$item.plink.href}}"><i class="shashape source"></i></a>{{/if}}
		</div>
		<div class="wall-item-actions">
			<div class="wall-item-actions-author">
				<a href="{{$item.profile_url}}" target="redir" alt="{{$item.linktitle}}" title="{{$item.linktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.sparkle}}">{{$item.name}}</span></a>
                                <span class="wall-item-ago" title="{{$item.localtime}}">{{$item.ago}}</span>
				 {{if $item.owner_url}}<br/>{{$item.to}} <a href="{{$item.owner_url}}" target="redir" alt="{{$item.olinktitle}}" title="{{$item.olinktitle}}" class="wall-item-name-link"><span class="wall-item-name{{$item.osparkle}}" id="wall-item-ownername-{{$item.id}}">{{$item.owner_name}}</span></a> {{$item.vwall}}
				 {{/if}}
			</div>
			
			<div class="wall-item-actions-social">
			{{if $item.star}}
				<a href="#" id="star-{{$item.id}}" onclick="dostar({{$item.id}}); return false;" class="{{$item.star.classdo}}" alt="{{$item.star.do}}" title="{{$item.star.do}}"><i class="shashape star"></i></a> <a href="#" id="unstar-{{$item.id}}" onclick="dostar({{$item.id}}); return false;" class="{{$item.star.classundo}}" title="{{$item.star.undo}}"><i class="shashape star-full"></i></a>
			{{/if}}
			{{if $item.ignore}}
			    <a href="#" id="ignore-{{$item.id}}" onclick="doignore({{$item.id}}); return false;" class="{{$item.ignore.classdo}}" alt="{{$item.ignore.do}}" title="{{$item.ignore.do}}"><i class="shashape blind"></i></a>
			    <a href="#" id="unignore-{{$item.id}}" onclick="doignore({{$item.id}}); return false;" class="{{$item.ignore.classundo}}" alt="{{$item.ignore.undo}}" title="{{$item.ignore.undo}}"><i class="shashape see"></i></a>
			{{/if}}
			{{if $item.tagger}}
				<a href="#" id="tagger-{{$item.id}}" onclick="itemTag({{$item.id}}); return false;" class="{{$item.tagger.class}}" alt="{{$item.tagger.add}}" title="{{$item.tagger.add}}"><i class="shashape hash"></i></a>
			{{/if}}
			{{if $item.filer}}
                                <a href="#" id="filer-{{$item.id}}" onclick="itemFiler({{$item.id}}); return false;" class="filer-item filer-icon" alt="{{$item.filer}}" title="{{$item.filer}}"><i class="shashape arrow-down"></i></a>
			{{/if}}			
			
			{{if $item.vote}}
				<a href="#" id="like-{{$item.id}}" {{if $item.responses.like.self}} class="active"{{/if}} alt="{{$item.vote.like.0}}" title="{{$item.vote.like.0}}" onclick="dolike({{$item.id}},'like'); return false"><i class="shashape like"></i></a>
				{{if $item.vote.dislike}}
				<a href="#" id="dislike-{{$item.id}}" {{if $item.responses.like.self}} class="active"{{/if}} alt="{{$item.vote.dislike.0}}" title="{{$item.vote.dislike.0}}" onclick="dolike({{$item.id}},'dislike'); return false"><i class="shashape unlike"></i></a>
				{{/if}}
						
                            {{if $item.vote.share}}
                                    <a href="#" id="share-{{$item.id}}" alt="{{$item.vote.share.0}}" title="{{$item.vote.share.0}}" onclick="jotShare({{$item.id}}); return false"><i class="shashape arrow-leftright2"></i></a>
                            {{/if}}			
			{{/if}}
			{{if $item.isevent}}
				<a href="#" role="button" id="attendyes-{{$item.id}}" {{if $item.responses.like.self}} class="active"{{/if}} title="{{$item.attend.0}}" onclick="dolike({{$item.id}},'attendyes'); return false;"><i class="shashape yes"></i></a>
				<a href="#" role="button" id="attendno-{{$item.id}}" {{if $item.responses.like.self}} class="active"{{/if}} title="{{$item.attend.1}}" onclick="dolike({{$item.id}},'attendno'); return false;"><i class="shashape no"></i></a>
				<a href="#" role="button" id="attendmaybe-{{$item.id}}" {{if $item.responses.like.self}} class="active"{{/if}} title="{{$item.attend.2}}" onclick="dolike({{$item.id}},'attendmaybe'); return false;"><i class="shashape hmm"></i></a>
			{{/if}}
			</div>
			
			<div class="wall-item-actions-tools">

				{{if $item.drop.pagedrop}}
					<input type="checkbox" alt="{{$item.drop.select}}" title="{{$item.drop.select}}" name="itemselected[]" class="item-select" value="{{$item.id}}" />
				{{/if}}
				{{if $item.drop.dropping}}
					<a href="item/drop/{{$item.id}}" onclick="return confirmDelete();" class="navicon delete" alt="{{$item.drop.delete}}" title="{{$item.drop.delete}}"><i class="shashape delete"></i></a>
				{{/if}}
				{{if $item.edpost}}
					<a class="navicon edit" href="{{$item.edpost.0}}" alt="{{$item.edpost.1}}" title="{{$item.edpost.1}}"><i class="shashape edit"></i></a>
				{{/if}}
			</div>
			
		</div>
	</div>
	<div class="wall-item-bottom">
		<div class="wall-item-links"></div>
		{{if $item.responses}}
			{{foreach $item.responses as $verb=>$response}}
				<div class="wall-item-{{$verb}}" id="wall-item-{{$verb}}-{{$item.id}}">{{$response.output}}</div>
			{{/foreach}}
		{{/if}}
	</div>
	
	{{if $item.threaded}}{{if $item.comment}}{{if $item.indent==comment}}
	<div class="wall-item-bottom commentbox">
		<div class="wall-item-links"></div>
		<div class="wall-item-comment-wrapper">
					{{$item.comment}}
		</div>
	</div>
	{{/if}}{{/if}}{{/if}}
</div>


{{foreach $item.children as $child}}
	{{if $child.type == tag}}
		{{include file="wall_item_tag.tpl" item=$child}}
	{{else}}
		{{include file="{{$item.template}}" item=$child}}
	{{/if}}
{{/foreach}}

{{if $item.thread_level!=1}}</div>{{/if}}


{{if $mode == display}}
{{else}}
{{if $item.comment_lastcollapsed}}</div>{{/if}}
{{/if}}

{{* top thread comment box *}}
{{if $item.threaded}}{{if $item.comment}}{{if $item.thread_level==1}}
<div class="wall-item-comment-wrapper" >{{$item.comment}}</div>
{{/if}}{{/if}}{{/if}}


{{if $item.flatten}}
<div class="wall-item-comment-wrapper" >{{$item.comment}}</div>
{{/if}}

<form id="profile-jot-form" action="{{$action}}" method="post">
	<div id="jot">
		<div id="profile-jot-desc" class="jothidden">&nbsp;</div>
		<input name="title" id="jot-title" type="text" placeholder="{{$placeholdertitle}}" title="{{$placeholdertitle}}" value="{{$title}}" class="jothidden" style="display:none" />
		{{if $placeholdercategory}}
		<input name="category" id="jot-category" type="text" placeholder="{{$placeholdercategory}}" title="{{$placeholdercategory}}" value="{{$category}}" class="jothidden" style="display:none" />
		{{/if}}
		<div id="character-counter" class="grey jothidden"></div>
		


		<input type="hidden" name="type" value="{{$ptyp}}" />
		<input type="hidden" name="profile_uid" value="{{$profile_uid}}" />
		<input type="hidden" name="return" value="{{$return_path}}" />
		<input type="hidden" name="location" id="jot-location" value="{{$defloc}}" />
		<input type="hidden" name="coord" id="jot-coord" value="" />
		<input type="hidden" name="post_id" value="{{$post_id}}" />
		<input type="hidden" name="preview" id="jot-preview" value="0" />
		<input type="hidden" name="post_id_random" value="{{$rand_num}}" />
		{{if $notes_cid}}
		<input type="hidden" name="contact_allow[]" value="<{{$notes_cid}}>" />
		{{/if}}

		<textarea rows="5" cols="64" class="profile-jot-text" id="profile-jot-text" name="body" >{{if $content}}{{$content}}{{else}}{{$share}}{{/if}}</textarea>

		<ul id="jot-tools" class="jothidden" style="display:none">
			<li><a href="#" onclick="return false;" id="wall-image-upload" alt="{{$upload}}" title="{{$upload}}"><span class="glyphicon glyphicon-picture"></span></a></li>
			<li><a href="#" onclick="return false;" id="wall-file-upload"  alt="{{$attach}}" title="{{$attach}}"><span class="glyphicon glyphicon-paperclip"></span></a></li>
			<li><a id="profile-link"  ondragenter="return linkdropper(event);" ondragover="return linkdropper(event);" ondrop="linkdrop(event);" onclick="jotGetLink(); return false;" alt=""{{$weblink}}"  title="{{$weblink}}"><span class="glyphicon glyphicon-link"></span></a></li>
			<li><a id="profile-video" onclick="jotVideoURL();return false;" alt="{{$video}}" title="{{$video}}"><span class="glyphicon glyphicon-film"></span></a></li>
			<li><a id="profile-audio" onclick="jotAudioURL();return false;" alt="{{$audio}}" title="{{$audio}}"><span class="glyphicon glyphicon-music"></span></a></li>
			<!-- TODO: waiting for a better placement 
			<li><a id="profile-location" onclick="jotGetLocation();return false;" title="{{$setloc}}">{{$shortsetloc}}</a></li>
			<li><a id="profile-nolocation" onclick="jotClearLocation();return false;" title="{{$noloc}}">{{$shortnoloc}}</a></li>
			-->
			<li><a id="jot-preview-link" onclick="preview_post(); return false;" alt="{{$preview}}" title="{{$preview}}"><span class="glyphicon glyphicon-cloud-upload"></span></a></li>

			{{$jotplugins}}

			{{if !$is_edit}}
			<li class="perms"><a id="jot-perms-icon" href="#profile-jot-acl-wrapper" alt="{{$permset}}" title="{{$permset}}" ><span class="glyphicon glyphicon-lock"></span></a></li>
			{{/if}}
			<li class="submit"><input type="submit" id="profile-jot-submit" name="submit" value="{{$share}}" /></li>
			<li id="profile-rotator" class="loading" style="display: none"><img src="images/rotator.gif" alt="{{$wait}}" title="{{$wait}}"  /></li>
		</ul>
	</div>
	
	<div id="jot-preview-content" style="display:none;"></div>

	<div style="display: none;">
		<div id="profile-jot-acl-wrapper" style="width:auto;height:auto;overflow:auto;">
			{{$acl}}
		</div>
	</div>

</form>

{{if $content}}<script>initEditor();</script>{{/if}}

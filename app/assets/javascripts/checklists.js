var toggleComplete = function toggleComplete(section){
	if($('.checklist-'+section).find('input[type=checkbox]:not(:disabled):not(:checked)').length == 0){
		$('.checklist-'+section).find('.status').html('<span class="complete">Complete</span>');
	} else {
		$('.checklist-'+section).find('.status').html('<span class="incomplete">Incomplete</span>');
	}
}

var toggleItemCheckbox = function toggleItemCheckbox(id,section){
	$.ajax({
		type: 'GET',
		url: '/checklists/'+ id +'/toggle_item',
		success: function() { toggleComplete(section) }
	});
}

$(document).ready(function(){
	toggleComplete('development');
	toggleComplete('stage');
	toggleComplete('production');
});

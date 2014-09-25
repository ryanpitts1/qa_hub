module ChecklistsHelper
	def toggle_tool_image(tool)
	  tool.value? ? "<img src='/assets/#{tool.release_data.label}_true.png' alt='#{tool.release_data.label}' />".html_safe : "<img src='/assets/#{tool.release_data.label}_false.png' alt='#{tool.release_data.label}' />".html_safe
	end
	
	def toggle_item_checkbox(item)
	  @environment = "'#{item.environment}'"
	  if user_signed_in?
      @disabled = ""
	  else
	    @disabled = "disabled='disabled'"
	  end
	  
		if item.value == true
		  if item.applicable == true
		    "<input type='checkbox' id='checklist_item_#{item.id}' data-id='#{item.id}' onclick=\"toggleItemCheckbox(#{item.id},#{@environment})\" checked='checked' #{@disabled} /> #{item.release_data.label}".html_safe
		  elsif item.applicable == false
		    "<input type='checkbox' id='checklist_item_#{item.id}' data-id='#{item.id}' onclick=\"toggleItemCheckbox(#{item.id},#{@environment})\" checked='checked' disabled='disabled' /> #{item.release_data.label}".html_safe
		  end
    elsif item.value == false
		  if item.applicable == true
		    "<input type='checkbox' id='checklist_item_#{item.id}' data-id='#{item.id}' onclick=\"toggleItemCheckbox(#{item.id},#{@environment})\" #{@disabled} /> #{item.release_data.label}".html_safe
		  elsif item.applicable == false
		    "<input type='checkbox' id='checklist_item_#{item.id}' data-id='#{item.id}' onclick=\"toggleItemCheckbox(#{item.id},#{@environment})\" disabled='disabled' /> #{item.release_data.label}".html_safe
		  end
	  end
	end
	
	def toggle_applicable(item)
		item.applicable? ? "<img src='/assets/iconNotApplicable.png' alt='Not Applicable' /> Mark Not Applicable".html_safe : "<img src='/assets/iconSave.png' alt='Applicable' /> Mark Applicable".html_safe
	end
end
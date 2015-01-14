$myName = $('#my-name')
$likeIcon = $('.like-icon')
$likeButton = $('.like-button')
$likes = $('#likes')

###
# @param {String} myName: A String indicating the name of user who click the `like` button
# @param {String} dataId: A String indicating the id of the picture or video
# @param {String} dataType: A String indicating type of the data
# @param {Number} likeChange: A number indicating   
###
requestChangeLike = (myName, dataId, dataType, likeChange)->
	url = '/data/changelike'
	data =
		myName: myName
		dataId: dataId
		dataType: dataType
		likeChange: likeChange
	$.ajax({
		type: "POST"
		url: url
		data: data
		success: (data)->
	})

showLoginAlert = ->
	alert('请先登录')

class Like
	constructor: (@page)->
	init: ->
		if @page is 'data-list'
			@bindHandler()
		else
			@detailPageBind()
	bindHandler: ->
		$likeIcon.bind 'click', ->
			if $myName.text()
				$likeNum = $(@).parent().parent().parent()
							.siblings('.panel-heading')
							.find('.data-likes')
				currentText = $likeNum.text()
				dataType = $(@).data('datatype')
				id = $(@).data('id')
				if $(@).hasClass('liked')
					$(@).removeClass('liked')
					requestChangeLike($myName.text(), id, dataType, -1)
					$likeNum.text(Number(currentText) - 1)
				else
					$(@).addClass('liked')
					requestChangeLike($myName.text(), id, dataType, 1)
					$likeNum.text(Number(currentText) + 1)
			else
				showLoginAlert()
	detailPageBind: ->
		$likeButton.bind 'click', ->
			if $myName.text()
				dataType = $(@).data('datatype')
				id = $(@).data('id')
				currentIndex = $likes.text()
				if $(@).hasClass('liked')
					$(@).removeClass('liked').find('p').text('点赞 +1')
					$likes.text( '赞 ' + (Number(currentIndex.slice(2, currentIndex.length)) - 1))					
					requestChangeLike($myName.text(), id, dataType, -1)
				else
					$(@).addClass('liked').find('p').text('已点赞')
					$likes.text( '赞 ' + (Number(currentIndex.slice(2, currentIndex.length)) + 1))
					requestChangeLike($myName.text(), id, dataType, 1)

module.exports = Like

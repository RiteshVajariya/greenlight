# BigBlueButton open source conferencing system - http://www.bigbluebutton.org/.
#
# Copyright (c) 2016 BigBlueButton Inc. and by respective authors (see below).
#
# This program is free software; you can redistribute it and/or modify it under the
# terms of the GNU Lesser General Public License as published by the Free Software
# Foundation; either version 3.0 of the License, or (at your option) any later
# version.
#
# BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.

# Previous Meetings class

class @PreviousMeetings
  @init: (type) ->
    $('.center-panel-wrapper').off 'click', '.fill-meeting-name'
    $('.center-panel-wrapper').on 'click', '.fill-meeting-name', (event, msg) ->
      name = $(this).text()
      $('input.meeting-name').val(name).trigger('input')

    $('ul.previously-joined').empty()
    joinedMeetings = localStorage.getItem(type)
    if joinedMeetings && joinedMeetings.length > 0
      joinedMeetings = joinedMeetings.split(',')

      for m in joinedMeetings by -1
        $('ul.previously-joined').append('<li><a class="fill-meeting-name">'+m+'</a></li>')

      $('.center-panel-wrapper .previously-joined-wrapper').removeClass('hidden')

  @add: (names) ->
    meetings = $('ul.previously-joined > li').toArray().map( (li) ->
      return li.innerText
    )
    index = meetings.indexOf('')
    if index > 1
      meetings.splice(index, 1)
    if Array.isArray(names)
      names = names.filter( (value) ->
        return $.inArray(value, meetings) == -1
      )
      for m in names
        if $('ul.previously-joined').length > 4
          return
        $('ul.previously-joined').append('<li><a class="fill-meeting-name">'+m+'</a></li>')

      $('.center-panel-wrapper .previously-joined-wrapper').removeClass('hidden')
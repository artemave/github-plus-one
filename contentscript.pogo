path = window.location.pathname

if (path.match r/issues\/\d+/)
  upvote button = $('<a>', class: 'button minibutton primary bigger', style: "margin-left:10px").text '+1'
  upvote button.on 'click'
    $ 'textarea[name="comment[body]"]'.text '+1'
    $ 'button[type=submit]:contains("Comment"):last'.click()
    $ 'textarea[name="comment[body]"]'.text ''

  $ 'h2.discussion-topic-title'.append(upvote button)
else if (path.match r/issues$/)
  hottest menu item container = $('<a>', class: 'select-menu-item js-navigation-open js-navigation-item')
  selected check              = $('<span>', class: 'select-menu-item-icon octicon octicon-check')
  item text                   = $('<span>', class: 'select-menu-item-text js-select-button-text').text 'Hottest'

  hottest sort option = hottest menu item container.append(selected check).append(item text)

  $ '.js-issues-sort .select-menu-modal'.append(hottest sort option)

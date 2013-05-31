upvote button = $('<a>', class: 'button minibutton primary bigger', style: "margin-left:10px").text '+1'
upvote button.on 'click'
  $ 'textarea[name="comment[body]"]'.text '+1'
  $ 'button[type=submit]:contains("Comment"):last'.click()
  $ 'textarea[name="comment[body]"]'.text ''

$ 'h2.discussion-topic-title'.append(upvote button)

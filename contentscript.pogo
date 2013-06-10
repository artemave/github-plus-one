path = window.location.pathname
button = $('<a>', class: 'button minibutton primary bigger', style: "margin-left:10px")

if (path.match r/issues|pull\/\d+/)
  number of votes = $('.comment-body p').filter
    $(this).text().match r/\+\d/
  .length || 1

  button.text "+#(number of votes)".on 'click'
    $ 'textarea[name="comment[body]"]'.text '+1'
    $ 'button[type=submit]:contains("Comment"):last'.click()
    $ 'textarea[name="comment[body]"]'.text ''

    button.text "+#(number of votes + 1)"

  $ 'h2.discussion-topic-title'.append(button)
/*else if (path.match r/issues$/)*/
  /*button.css 'background-color' 'red'.text 'Hotness!'.on 'click'*/
  /*  console.log 'hellom'*/

  /*$ '.issues-list-options'.append(button)*/

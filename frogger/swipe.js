// Slightly modified code by Dave Dunkin
    // http://rabblerule.blogspot.com/2009/08/detecting-swipe-in-webkit.html

    function addSwipeListener(el, listener)
    {
     var startX;
     var dx;
     var direction;

     function cancelTouch()
     {
      el.removeEventListener('touchmove', onTouchMove);
      el.removeEventListener('touchend', onTouchEnd);
      startX = null;
      startY = null;
      direction = null;
     }

     function onTouchMove(e)
     {
      if (e.touches.length > 1)
      {
       cancelTouch();
      }
      else
      {
       dx = e.touches[0].pageX - startX;
       var dy = e.touches[0].pageY - startY;
       if (direction == null)
       {
        direction = dx;
       }
       else if ((direction < 0 && dx > 0) || (direction > 0 && dx < 0) || Math.abs(dy) > 400)
       {
        cancelTouch();
       }
      }
     }

     function onTouchEnd(e)
     {
       cancelTouch();
      if (Math.abs(dx) > 30)
      {
        listener({ target: el, direction: dx > 0 ? 'right' : 'left' });
        dx = 0;
      }
     }

     function onTouchStart(e)
     {
        e.preventDefault();
        e.stopPropagation();
      if (e.touches.length == 1)
      {
       startX = e.touches[0].pageX;
       startY = e.touches[0].pageY;
       el.addEventListener('touchmove', onTouchMove, false);
       el.addEventListener('touchend', onTouchEnd, false);
      }
     }

     el.addEventListener('touchstart', onTouchStart, false);
    }
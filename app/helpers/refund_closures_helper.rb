module RefundClosuresHelper
  def payed_fg?(refund_closure)
    if refund_closure.payed == true
      "<span class='text-success'><i class='fa-solid fa-thumbs-up'></i>&nbsp;<i class='fa-solid fa-cash-register'></i>&nbsp;Pagato</span>".html_safe
    else
      "<span class='text-warning'><i class='fa-solid fa-thumbs-down'></i>&nbsp;<i class='fa-solid fa-cash-register'></i>&nbsp;DaPagare</span>".html_safe
    end
  end
end

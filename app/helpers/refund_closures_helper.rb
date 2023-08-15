module RefundClosuresHelper
  def payed_fg?(refund_closure)
    if refund_closure.payed == true
      "fg-payed"
    else
      "fg-unpayed"
    end
  end

  def payed_icon?(refund_closure)
    if refund_closure.payed == true
      "icons/smile-happy.svg"
    else
      "icons/smile-sad.svg"
    end
  end
end

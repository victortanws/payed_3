class MyDebtsController < ApplicationController
  before_action :current_user_must_be_my_debt_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_my_debt_user
    my_debt = MyDebt.find(params[:id])

    unless current_user == my_debt.initiator
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @my_debts = MyDebt.all

    render("my_debts/index.html.erb")
  end

  def show
    @my_debt = MyDebt.find(params[:id])

    render("my_debts/show.html.erb")
  end

  def new
    @my_debt = MyDebt.new

    render("my_debts/new.html.erb")
  end

  def create
    @my_debt = MyDebt.new

    @my_debt.initiator_id = params[:initiator_id]
    @my_debt.other_id = params[:other_id]

    save_status = @my_debt.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/my_debts/new", "/create_my_debt"
        redirect_to("/my_debts")
      else
        redirect_back(:fallback_location => "/", :notice => "My debt created successfully.")
      end
    else
      render("my_debts/new.html.erb")
    end
  end

  def edit
    @my_debt = MyDebt.find(params[:id])

    render("my_debts/edit.html.erb")
  end

  def update
    @my_debt = MyDebt.find(params[:id])

    @my_debt.initiator_id = params[:initiator_id]
    @my_debt.other_id = params[:other_id]

    save_status = @my_debt.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/my_debts/#{@my_debt.id}/edit", "/update_my_debt"
        redirect_to("/my_debts/#{@my_debt.id}", :notice => "My debt updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "My debt updated successfully.")
      end
    else
      render("my_debts/edit.html.erb")
    end
  end

  def destroy
    @my_debt = MyDebt.find(params[:id])

    @my_debt.destroy

    if URI(request.referer).path == "/my_debts/#{@my_debt.id}"
      redirect_to("/", :notice => "My debt deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "My debt deleted.")
    end
  end
end

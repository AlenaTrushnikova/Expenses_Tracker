class ExpensesController < ApplicationController
  def index
    expenses = User.all
    render json: expenses
  end
end

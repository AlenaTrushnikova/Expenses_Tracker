class ExpensesController < ApplicationController
  # def index
  #   expenses = Expense.all
  #   render json: expenses
  # end
  #
  # def show
  #   expense = Expense.find_by(params[:id])
  #   render json: expense
  # end
  #
  # def edit
  #   expense = Expense.find_by(id: params[:id])
  # end
  #
  # def update
  #   expense = Expense.find_by(id: params[:id])
  #   expense.update(date: params[:date], name: params[:name])
  #   render json: expense
  # end
  #
  # def create
  #   expense = Expense.create(amount: params[:amount], date: params[:date], description: params[:description], user_id: params[:user_id], category_id: params[:category_id])
  #   render json: expense
  # end
  #
  # def destroy
  #
  #   expense = Expense.find_by(params[:id])
  #   expense.destroy
  #   render json: {"Message": "Expense was deleted"}
  # end

end

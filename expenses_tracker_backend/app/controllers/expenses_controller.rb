class ExpensesController < ApplicationController

  def index
    expenses = Expense.all
    render json: expenses
  end
  
  def show
    expense = Expense.find_by(id: params[:id])
    render json: expense, include: :category
  end

  
  def edit
    expense = Expense.find_by(id: params[:id])
  end
  
  def update
    expense = Expense.find_by(id: params[:id])
    expense.update(amount: params[:amount], date: params[:date], description: params[:description], user_id: params[:userId], category_id: params[:categoryId])
    render json: expense
  end

  def create
    expense = Expense.create(amount: params[:amount], date: params[:date], description: params[:description], user_id: params[:userId], category_id: params[:categoryId])
    render json: expense
  end

  def destroy
    expense = Expense.find_by(id: params[:id])
    expense.destroy
    render json: {"Message": "Expense was deleted"}
  end

end

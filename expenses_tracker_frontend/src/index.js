//const proxyurl = "https://cors-anywhere.herokuapp.com/"
const usersURL = 'http://localhost:3000/users'

getUserExpenses(5)
//addExpenseToTable()

function getUserExpenses(id){

    fetch(`${usersURL}/${id}`)
    .then(res => res.json())
    .then(user => {
        user.expenses.forEach(expense => addExpenseToTable(expense))
    }
}

function addExpenseToTable(expense){

    let tableBody = document.getElementById('expenses-table-body')

    let description = document.createElement('tr')
    let amount = document.createElement('tr')
    let date = document.createElement('tr')
    let category = document.createElement('tr')

    description.textContent = exp.description
    amount.textContent = exp.amount
    date.textContent = exp.date
    category.textContent = exp.category

    tableBody.append(description, amount, date, category)

}
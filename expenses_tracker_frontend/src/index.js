const usersURL = 'http://localhost:3000/users'

getUserExpenses(5)

function getUserExpenses(id){

    fetch(`${usersURL}/${id}`)
    .then(res => res.json())
    .then(user => {
        user.expenses.forEach(expense => addExpenseToTable(expense))
    })
}

function addExpenseToTable(expense){
    console.log('here', expense)
    let tableBody = document.getElementById('expenses-table-body')
    let tr = document.createElement('tr')

    let description = document.createElement('td')
    let amount = document.createElement('td')
    let date = document.createElement('td')
    let category = document.createElement('td')
    let editBtn = document.createElement('button')
    let deleteBtn = document.createElement('button')

    tr.id = `expense-${expense.id}`
    editBtn.id = `edit-exp-${expense.id}`
    deleteBtn.id = `delete-exp-${expense.id}`

    editBtn.textContent = 'Edit'
    deleteBtn.textContent = 'Delete'

    description.textContent = expense.description
    amount.textContent = `$${expense.amount}`
    date.textContent = expense.date
    category.textContent = expense.category.name

    tr.append(description, amount, date, category, editBtn, deleteBtn)
    tableBody.appendChild(tr)

}
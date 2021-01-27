document.addEventListener('DOMContentLoaded', function () {
    userLogin()
})

const BASE_URL = "http://localhost:3000"
const USERS_URL = `${BASE_URL}/users`
const GROUPED_EXPENSES_URL = `${USERS_URL}/expenses_by_categories`
var User = {};
// User['id'] = 5;
// User['name'] = 'Alena';
// User['budget'] = 10000.00;



//Expenses by Categories
function buildGroupedExpenses(user) {
    fetch(GROUPED_EXPENSES_URL + `/${user.id}`)
        .then(resp => resp.json())
        .then(groupedCategories => categoriesTable(groupedCategories))
}

function categoriesTable(groupedCategories) {
    let body = document.querySelector('#grouped-expenses-body')

    groupedCategories.categories.forEach(category => {
        let catRow = document.createElement('tr')
        let categoryName = document.createElement('td')
        categoryName.textContent = category.categoryName
        let categoryAmount = document.createElement('td')
        categoryAmount.textContent = convertMoney(category.amount)
        catRow.append(categoryName, categoryAmount)
        body.append(catRow)
    })

    let total = document.createElement('tr')
    let expenseTotal = document.createElement("td")
    expenseTotal.innerText = "Total Expenses"
    expenseTotal.className = "fw-bold"
    let expenseAmount = document.createElement('td')
    expenseAmount.textContent = convertMoney(groupedCategories.totalAmount)
    expenseAmount.className = "fw-bold"
    total.append(expenseTotal, expenseAmount)
    body.append(total)
}

//All Expenses
function getUserExpenses(user) {

    fetch(`${USERS_URL}/${user.id}`)
        .then(res => res.json())
        .then(user => {
            user.expenses.forEach(expense => addExpenseToTable(expense))
        })
}

function addExpenseToTable(expense) {
    let tableBody = document.getElementById('expenses-table-body')
    let tr = document.createElement('tr')

    let description = document.createElement('td')
    let amount = document.createElement('td')
    let date = document.createElement('td')
    let category = document.createElement('td')
    let tdEditBtn = document.createElement('td')
    let tdDeleteBtn = document.createElement('td')
    let editBtn = document.createElement('button')
    let deleteBtn = document.createElement('button')

    tr.id = `expense-${expense.id}`
    editBtn.id = `edit-exp-${expense.id}`
    editBtn.className = "btn btn-outline-success btn-sm"
    deleteBtn.id = `delete-exp-${expense.id}`
    deleteBtn.className = "btn btn-outline-secondary btn-sm"

    editBtn.textContent = 'Edit'
    deleteBtn.textContent = 'Delete'

    description.textContent = expense.description
    amount.textContent = convertMoney(expense.amount)
    date.textContent = expense.date
    category.textContent = expense.category.name
    tdEditBtn.append(editBtn)
    tdDeleteBtn.append(deleteBtn)
    tr.append(description, amount, date, category, tdEditBtn, tdDeleteBtn)
    tableBody.appendChild(tr)
}

// Display Budget
function displayBudget(user) {
    let budgetAmount = document.querySelector('#budget-amount')
    budgetAmount.textContent = 'Budget: ' + convertMoney(user.budget)
    let budgetEditBtn = document.querySelector('#budget-edit')
    budgetEditBtn.addEventListener('click', handleEdit)
}
function handleEdit (){
    let budgetForm = document.querySelector('.budget')
    if (budgetForm.classList.contains("hidden") == true) {
        budgetForm.className = "budget flex"
    } else
        budgetForm.className = "budget hidden"
}

//Edit Budget
function editBudget() {
    let submitBudgetBtn = document.querySelector('#budget-submit')
    submitBudgetBtn.addEventListener('click', handleSubmit)
}

function handleSubmit() {
    let newBudget = document.querySelector('#set-budget-input').value
    postBudget(newBudget)
}

function postBudget(newBudget) {
    intBudget = parseInt(newBudget)
    if (intBudget < 0 || newBudget === "") {
        intBudget = 0
    }
    fetch(USERS_URL + `/${User.id}`,{
        method: 'PATCH',
        headers: {
            'Content-Type':'application/json',
        },
        body: JSON.stringify({budget: intBudget})
    })
        .then(resp => resp.json())
        .then(budget => {
            let displayBudget = document.querySelector('#budget-amount')
            displayBudget.textContent = 'Budget: ' + convertMoney(intBudget)
            console.log(intBudget)
            let newBudgetInput = document.querySelector('#set-budget-input')
            newBudgetInput.value = ""
        })
}


//Convert Int to $$
function convertMoney(money) {
    return `$ ${money.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}`
}

function userLogin() {
    let userLoginBtn = document.querySelector('#user-login')
    userLoginBtn.addEventListener('click', handleLogin)
}

function handleLogin() {
    let userName = document.querySelector('#user-name').value
    if (userName == "") {
        return
    }
    fetch(USERS_URL, {
        method: 'POST',
        headers: {
            'Content-Type':'application/json',
        },
        body: JSON.stringify({'name': userName})
        })
        .then(resp => resp.json())
        .then(user => setupUI(user))
}

function setupUI(user) {
    User = user
    let main = document.querySelector('#main')
    main.className = "container"

    let userInfo = document.querySelector('#user-info')
    userInfo.className = "navbar-brand mb-0 text-light"

    let loginForm = document.querySelector('#login-form')
    loginForm.className = "hidden"

    console.log(User)

    buildGroupedExpenses(User)
    getUserExpenses(User)
    displayBudget(User)
    editBudget()
}
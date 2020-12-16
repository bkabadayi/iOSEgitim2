//Şirket adı ve bütçesi, personel adı, yaşı ve maaşı olacak, personel türleri (asistan ve yetkili)

// companyName, companyBudget, employeeName, employeeAge, employeeSalary, assistant, director

// assistantSalary = 10000 + (employeeAge * 100)
// directorSalary = 10000 + (employeeAge * 200)

// companyIncome, companyOutcome

// button -> paySalaries
// print -> totalSalary



// Employees may be assistant or director
enum EmployeeType: Int {
    case assistant = 0
    case director
}

// Define an employee
class Employee {
    var name: String
    var age: Int
    var jobPosition: EmployeeType
    var salary: Int
    
    init(name: String, age: Int, jobPosition: EmployeeType) {
        self.name = name
        self.age = age
        self.jobPosition = jobPosition
        
        // Calculate salary
        var salaryValue: Int = 0
        if jobPosition == .assistant {
            salaryValue = (age * 100) + 10000
        } else if jobPosition == .director {
            salaryValue = (age * 200) + 10000
        }
        self.salary = salaryValue
    }
}

// Define a company
class Company {
    
    // Company must have employees that are created in Employee class and name, budget, income, outcome
    var employees: [Employee] = []
    var companyName: String = ""
    var companyBudget: Int = 0
    var companyIncome: Int = 0
    var companyOutcome: Int = 0
    
    // Initializations
    init(employees: [Employee], companyName: String, companyBudget: Int, companyIncome: Int, companyOutcome: Int) {
        self.employees = employees
        self.companyName = companyName
        self.companyBudget = companyBudget
        self.companyIncome = companyIncome
        self.companyOutcome = companyOutcome
    }
    
    // Function to calculate the salary that company pays to employees
    func calculateSalary() -> Int {
        var totalSalary: Int = 0
        for item in self.employees {
            totalSalary += item.salary
        }
        return totalSalary
    }
    
    func getBudget() -> Int {
        return companyBudget-(companyOutcome - companyIncome)
    }
    
    func paySalary() {
        companyOutcome += calculateSalary()
    }

}

// Create employees
let employee1 = Employee(name: "Berkin", age: 23, jobPosition: .assistant)
let employee2 = Employee(name: "Barıs", age: 25, jobPosition: .director)
let employee3 = Employee(name: "Hakan", age: 27, jobPosition: .assistant)
let employee4 = Employee(name: "Hande", age: 31, jobPosition: .assistant)
let employee5 = Employee(name: "Hülya", age: 36, jobPosition: .assistant)
let employee6 = Employee(name: "Serkan", age: 25, jobPosition: .assistant)
let employee7 = Employee(name: "Hulki", age: 27, jobPosition: .assistant)
let employee8 = Employee(name: "Şebnem", age: 31, jobPosition: .assistant)
let employee9 = Employee(name: "Selin", age: 34, jobPosition: .assistant)
let employees = [employee1, employee2, employee3, employee4, employee5, employee6, employee7, employee8, employee9]




//Create my company
let myCompany = Company(employees: employees, companyName: "Ziraat Teknoloji", companyBudget: 1000000, companyIncome: 100000, companyOutcome: 50000)


print("Company has 8 employees:")
print(myCompany.employees[0].name)
print(myCompany.employees[1].name)
print(myCompany.employees[2].name)
print(myCompany.employees[3].name)
print(myCompany.employees[4].name)
print(myCompany.employees[5].name)
print(myCompany.employees[6].name)
print(myCompany.employees[7].name)
print(myCompany.employees[8].name)
print("\n")

print("Company's name is ", myCompany.companyName)
print("Company's budget is", myCompany.companyBudget)
print("Company's income is", myCompany.companyIncome)
print("Company's outcome is", myCompany.companyOutcome)
print("Total salary in this company is", myCompany.calculateSalary())

myCompany.getBudget()
myCompany.paySalary()
myCompany.getBudget()

print("New budget after paying salaries", myCompany.getBudget())

myCompany.paySalary()
print("New budget after paying salaries", myCompany.getBudget())

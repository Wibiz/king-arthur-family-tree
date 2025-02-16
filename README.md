King Arthur Family Tree

This is a Ruby on Rails project using Ruby 3.2.3 and Rails 8.0.1.

## Prerequisites

Make sure you have the following installed:
- Ruby 3.2.3
- Rails 8.0.1
- SQLite3

## Getting Started

1. Clone the repository
2. Navigate to the project directory
3. Bundle install inside the project directory
4. Set up the database:
    - rails db:migrate
    - rails db:seed
5. Run the application:
    1. ruby bin/process_family_commands {file .txt path}
        example : ruby bin/process_family_commands test/files/valid_input.txt
    2. Use API : 
        * run rails s
        * hit this curl : 
        curl -X POST -F "file=@/{path to your txt file}" http://localhost:3000/api/v1/process_commands
        example : 
        curl -X POST -F "file=@/C:/king_arthur_family_three/test/files/get_relationship.txt" http://localhost:3000/api/v1/process_commands




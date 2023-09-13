# Write a Ruby program that allows users to perform basic arithmetic operations on numbers and keeps a history of their calculations. The program should repeatedly prompt the user for the number of times they want to perform the operation and then ask for input on the operator and numbers to perform the calculation. Ensure that at least two numbers are used for each calculation. If an invalid operator is entered, the program should display an error message.
# Implement the following functionalities:
#     1.Accept the number of times the user wants to perform the operation.
#     2.For each operation, prompt the user for an operator (+, -, *, /) and two numbers.
#     3.Perform the calculation based on the operator and display the result.
#     4.Store each operation and its result in a history list.
#     5.Allow the user to view the history by entering 'h' or 'H'.
#     6.Allow the user to exit the program by entering 'x' or 'X'.
#     7.Ensure that the program continues to run until the user chooses to exit.




his = []
while true 
    result = ""
    puts "Enter the number of operants: "
    while 1 
        n = gets.to_i
        if n<2 
            puts "For performing arithmetic operator take at least two number"
        else
            break
        end    
    end

    def cal(n1, n2, op)
        case op
        when '+'
          n1 += n2
        when '-'
          n1 -= n2
        when '*'
          n1 *= n2
        when '/'
          n1 /= n2
        else
          puts "Invalid operator"
        end
        return n1
    end

    puts "Enter the number:"
    while true
      input = gets.chomp 
      if input =~ /\A-?\d+\z/
          n1 = input.to_f 
          break
      else
          puts "Please enter a valid number"
      end
    end
  
    i = 1
    result += "#{n1}"
    while i < n
      puts "Enter the operator (+, -, *, /):"
      while 1
        op = gets.chomp
        if op != '+' && op != '-' && op != '*' && op != '/'
            puts "Enter the valid operator"
        else
            break
        end        
      end 
      result += " #{op}"
      puts "Enter the number:"
      while true
        input1 = gets.chomp 
        if input1 =~ /\A-?\d+\z/
            n2 = input1.to_f 
            break
        else
            puts "Please enter a valid number"
        end
      end
      

      result += " #{n2}"
      n1 = cal(n1, n2, op)
      i += 1
    end
    
    result += " = #{n1}"
    his.push(result)
    puts result
    puts "Enter x/X for exit, y/Y for continue, h/H for history"
    chk = 0 

    while true 
        choice = gets.chomp
        if choice == 'h' || choice == 'H'
            puts his
            while true
              puts "Enter x/X for exit, y/Y for continue, h/H for history"
              choice1 = gets.chomp
              if choice1 == 'h' || choice1 == 'H'
                  puts his 
              elsif  choice1 == 'x' || choice1 == 'X'
                  chk = 1
                  break
              end
              if choice1 == 'x' || choice1 == 'X'
                chk = 1   
                break
              elsif choice1 == 'y' || choice1 == 'Y'
                  break
              elsif choice1 != 'h' && choice1 != 'H' 
                puts "Enter the valid choice"  
              end  
            end     
        elsif  choice == 'x' || choice == 'X'
            chk = 1
            break         
        end 
        if choice == 'h' || choice == 'H' || choice == 'x' || choice == 'X' || choice == 'y' || choice == 'Y'
          break
        else  
          puts "Enter the valid choice"  
        end   
    end 
    if chk == 1 
        break 
    end    
end            

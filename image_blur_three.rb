#Kanui - Komments
class Image
#Create a class called 'Image'. 
#(Capitalize it so we can know it's a class and can differentiate it from a method name)

  attr_accessor :image
#Utilize attr_accessor so Ruby can read and write the 'image' method for us.

    def initialize(image)
#Create an 'initialize' method and set it to expect one argument.
      @image = image
#Store the value of the argument in an instance variable in order to be 
#referenced across all methods within the context of this 'Image' class.
    end
#end the 'initialize' method.

    def blur(distance = 1)
#create a 'blur' method and set it to expect an argument 'distance' as well as defualt to 
#a value of 1 if no argument is given
      distance.times do 
        change
#Create a 'times loop' that will execute the 'change' method as many times as the value of
#the argument 'distance' specifies.
      end
#end the 'times loop'
    end
#end the blur method

    def change
#Create a 'change' method.
      blurry = []
#create an empty array called 'blurry'.
        @image.each_with_index do |line, line_n|
#Iterate over each of the indiviual arrays within the 2 demensional array stored 
#in our instance variable '@image' with an 'each_with_index' loop. This will store 
#each array, individually, in the 'line' variable as well as store a number representing 
#each arrays numerical placement within the 2 demensional array in the 'line_n' variable
#starting at index '0'.
          line.each_with_index do |vari, vari_n|
#Create another 'each_with_index' loop that will iterate over all the values within the 'line'
#variable and store them, individually, in a variable called 'vari' as well as store their
#numercial placement in a variable called 'vari_n' starting at index '0'.
            blurry << [line_n, vari_n] if vari == 1
#create an if statement that says if the value of 'vari' = 1 then push it's respective 
#numerical placement 'vari_n' and it's respective numerical placement of its parent array 
#'line_n' in the blurry array
          end
#end the '@image.each_with_index' loop
        end
#the 'line.each_with_index' loop

      blurry.each do |line_x, vari_x|
#Iterate over the the 'blurry' array with an each loop and store 'line_n' and 'vari_n' 
#respectively in the 'line_x' and 'vari_x' variables to be processed within the loop.

        @image[line_x-1][vari_x]=1 if line_x-1 >= 0
#Reference the found 1's index 'vari_x'. Reference it's parent array's index (line_x). 
#Subtract 1 from line_x to access the array before it. This will locate the postion directly 
#above the found 1. Set it equal to 1 if line_x-1 is greater than or equal to 0. 
        @image[line_x+1][vari_x]=1 if line_x+1 < y_axis_length
#Reference the found 1's index 'vari_x'. Reference it's parent array's index (line_x). 
#Add 1 to line_x to access the array after it. This will locate the postion directly below 
#the found 1. Set it equal to 1 if line_x+1 is less than 'y_axis_length' method. 
        @image[line_x][vari_x-1]=1 if vari_x-1 >= 0
#Reference the found 1's index 'vari_x' as well as it's parent array's index 'line_x'. 
#Subtract 1 from 'vari_x'. This will locate the postion directly to the left of the found 1. 
#Set it equal to 1 if 'vari_x-1' is greater than or equal to 0. 
        @image[line_x][vari_x+1]=1 if vari_x+1 < x_axis_length
#Reference the found 1's index 'vari_x' as well as it's parent array's index 'line_x'. 
#Add 1 to 'vari_x'. This will locate the postion directly to the right of the found 1. 
#Set it equal to 1 if 'vari_x+1' is less than the 'x_axis_length' method. 
        end   
#end the blurry.each loop
      end
#end the change method.

    def y_axis_length
#Create a y_axis_length method
      @image.length
#Utilize our instance variable '@image' as well as '.length' to find out the total contents
#of the outer array 
    end
#end the 'y_axis_length' method

    def x_axis_length 
#Create a x_axis_length method
      @image[0].length
#Utilize our instance variable '@image' as well as '.length' to find out the total contents
#of the outer array. Use '@image[0]' to access the contents of the first array within the outer array 
#(The array with index 0) 
    end
#end the 'x_axis_length' method


    def output_image
#Create an 'output_image' method. 
      @image.each do |x|
#Iterate over each of the indiviual arrays within the 2 demensional array we stored 
#in our instance variable '@image' with an 'each' loop.
#Store each of the arrays (individually) in a variable called 'x'.
        puts x.join
#Utitlize '.join' to remove brackets, commas, spaces, and/or quotes. 
#'puts' the product. 
      end
#end 'each' loop 
    end
#end 'out_put image' method
end
#end 'Image' class


image = Image.new([
                 [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                 [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                 [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 1]])
#create a new Image class instance with the given attributes
image.blur(3)
#puts the blur method given the value of the argument provided
image.output_image
#put the out_put image method
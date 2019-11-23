class Image
  attr_accessor :image

    def initialize(image)
      @image = image
    end

    def blur

    blurry = []
        @image.each_with_index do |line, line_n|
          line.each_with_index do |vari, vari_n|
            blurry << [line_n, vari_n] if vari == 1
          end
        end

    blurry.each do |line_x, vari_x|
        @image[line_x-1][vari_x]=1 if line_x-1 >= 0
        @image[line_x+1][vari_x]=1 if line_x+1 < y_axis_length
        @image[line_x][vari_x-1]=1 if vari_x-1 >= 0
        @image[line_x][vari_x+1]=1 if vari_x+1 < x_axis_length
        end   
    end

    def y_axis_length
      @image.length
    end

    def x_axis_length 
      @image[0].length
    end

    def output_image
      @image.each do |x|
        puts x.join
      end
    end
end

image = Image.new([
                 [0, 0, 0, 0], 
                 [0, 1, 0, 0], 
                 [0, 0, 0, 1], 
                 [0, 0, 0, 0]])
image.blur
image.output_image
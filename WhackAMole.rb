require 'Gosu'

class Mole < Gosu::Window 

    def initialize 
        super 800, 600 
        self.caption = "Tutorial Game"
        @hammer = Gosu::Image.new('Sprites/hammer.png')
        @ruby = Gosu::Image.new('Sprites/ruby.png')
        @font = Gosu::Font.new(30)
        @Final_Screen = Gosu::Font.new(60)
        @time = 70
        @score = 0
        @x_coordinate = 0
        @y_coordinate = 0
        @velocity_x = 3
        @velocity_y = 2
        @ruby_visibility_counter = 0
        @ruby_visibility = true
        @end_game = false
        

    end

    def update
        
        unless @end_game
            def button_down(id)
                if id == Gosu::MsLeft
                    if Gosu.distance(mouse_x,mouse_y,@x_coordinate,@y_coordinate) < 55 && @ruby_visibility
                        @score += 1
                    end
                end
            
            end
            
            @x_coordinate += @velocity_x
            @y_coordinate += @velocity_y
            if @x_coordinate < 0 || @x_coordinate > 800
                @velocity_x *= -1
                
            end
            
            if @y_coordinate < 0 || @y_coordinate > 600
                @velocity_y *= -1
            end
            
            @ruby_visibility_counter+=1
            
            if @ruby_visibility_counter == 120 
                @ruby_visibility = false
            end
            if @ruby_visibility_counter == 240 
                @ruby_visibility = true
                @ruby_visibility_counter = 0
            end
            @time -= 1
        end


    end

    def draw
        @hammer.draw(mouse_x-80,mouse_y-38,2)
        @font.draw("Score: #{@score}",0,0,0)
        @font.draw("Time left: #{@time/60}",620,0,0)
        
        if @ruby_visibility
            @ruby.draw(@x_coordinate-41,@y_coordinate-30,1)
        end    
        
        if @time <= 0
            @ruby_visibility = false
            @Final_Screen.draw("Game over",300,300,2)
            @end_game = true

        end


    end

end

lady = Mole.new
lady.show
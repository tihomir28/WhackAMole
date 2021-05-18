require 'gosu'

class Mole < Gosu::Window 

    def initialize 
        super 800, 600
        self.caption = "Tutorial Game"
        @hammer = Gosu::Image.new('Sprites/hammer.png')
        @ruby = Gosu::Image.new('Sprites/ruby.png')
        @font = Gosu::Font.new(30)

    end

    def update

    end

    def draw
        @hammer.draw(mouse_x-80,mouse_y-38,2)
        @ruby.draw(400,400,1)
        @font.draw("WhackAnIdiot",0,0,0)


    end

end

lady = Mole.new
lady.show
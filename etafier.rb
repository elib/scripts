
#ruby script for generating the eta comparison of two values and their error.
#paste the output directly in your LaTeX document, or MathType's editor window
#written by Eli Brody, 2008-12-27

#run script, input things when needed, and the result should be in your clipboard.

#install win32 clipboard from command line:
#gem install win32-clipboard

class Float
  def latex
    str = self.to_string
    #str.
  end
end

require 'rubygems'
require 'win32/clipboard'
include Win32

puts "Let's compute an Eta!"

puts "*******IMPORTANT: All values are in the form: 2.24E-4"
puts "Value as defined by the manufacturer ('Literature'): "
manufacturer = gets.chomp.to_f
puts "Error as defined by the manufacturer ('Literature'): "
manufacturer_err = gets.chomp.to_f
puts "Value that you measured: "
measured = gets.chomp.to_f
puts "Error from measurement: "
measured_err = gets.chomp.to_f

#calculation
top = (manufacturer - measured).abs
bottom = ((manufacturer_err)**2 + (measured_err)**2)**0.5
result = top/bottom

#~ manufacturer_string = "arar"
#~ manufacturer_err_string = "arar"
#~ measured_string = "arar"
#~ measured_err_string = "arar"
#~ result_string = result

strout =<<EOS
\\eta =
\\frac{\\left| X_{manufacturer} - X_{measured} \\right|}{\\sqrt{\\left({\\Delta X_{manufacturer}}\\right)^{2} + \\left({\\Delta X_{measured}}\\right)^{2}}}
=\\frac{\\left| #{manufacturer} - #{measured} \\right|}{\\sqrt{\\left({#{manufacturer_err}}\\right)^{2} + \\left({#{measured_err}}\\right)^{2}}}
=#{result}
EOS

Clipboard.set_data(strout)

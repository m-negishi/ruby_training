require 'test/unit'

Test::Unit::AutoRunner.run(true, './', ['-pattern=/_test\.rb\Z/i'])

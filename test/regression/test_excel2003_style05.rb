# -*- coding: utf-8 -*-
require 'helper'

class TestRegressionExcel2003Style05 < Test::Unit::TestCase
  def setup
    setup_dir_var
  end

  def teardown
    File.delete(@xlsx) if File.exist?(@xlsx)
  end

  def test_excel2003_style05
    @xlsx = 'excel2003_style05.xlsx'
    workbook    = WriteXLSX.new(@xlsx, :excel2003_style => true)
    worksheet   = workbook.add_worksheet

    worksheet.insert_image('B3', 'test/regression/images/red.jpg')

    workbook.close
    compare_xlsx_for_regression(File.join(@regression_output, @xlsx), @xlsx,
                                [],
                                {
                                  'xl/drawings/drawing1.xml' =>
                                  [
                                   '<xdr:cNvPr', '<a:picLocks', '<a:srcRect />', '<xdr:spPr', '<a:noFill />'
                                  ]
                                }
                                )
  end
end

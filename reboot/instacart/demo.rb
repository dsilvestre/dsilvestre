ssn_sample = "1 84 12 76 451 089 46"

def french_ssn_info(ssn_number)
pattern = /(?<gender>^\d)\s(?<year>\d{2})\s(?<month>\d{2})\s(?<department>\d{2})\s(?<first_random>\d{3})\s(?<rest_random>\d{3})\s(\d{?<final_two>2})/
ssn_number_pattern = ssn_number.match(pattern)

return
puts ssn_number_pattern


MONTHS = {
  12 => "December",
  11 => "November",
  10 => "October",

}

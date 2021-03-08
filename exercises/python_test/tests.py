# With the given word, fill in the functions below!
# Modify the variables i&n accordingly to fit the descriptions of the print
import unittest, graderunittest

class TestHelloPython(unittest.TestCase):
    def test_firstFive(self):
        """Check hello function return value (1p)"""
        import assignment
        self.assertEqual( assignment.firstFive("akumiitti"), "akumi")
        self.assertEqual( assignment.firstFive("saippuakauppias"), "saipp")


    def test_lastFive(self):
        """Check hello function return value (1p)"""
        import assignment
        self.assertEqual( assignment.lastFive("akumiitti"), "iitti")
        self.assertEqual( assignment.lastFive("saippuakauppias"), "ppias")


    def test_middleFour(self):
        """Check hello function return value (1p)"""
        import assignment
        self.assertEqual( assignment.middleFour("akumiitti"), "kumi")
        self.assertEqual( assignment.middleFour("saippuakauppias"), "aipp")


    def test_everyOther(self):
        """Check hello function return value (1p)"""
        import assignment
        self.assertEqual( assignment.everyOther("akumiitti"), "kmit")
        self.assertEqual( assignment.everyOther("saippuakauppias"), "apukupa")


    def test_backwards(self):
        """Check hello function return value (1p)"""
        import assignment
        self.assertEqual( assignment.backwards("akumiitti"), "ittiimuka")
        self.assertEqual( assignment.backwards("saippuakauppias"), "saippuakauppias")

if __name__ == '__main__':
    unittest.main(testRunner=graderunittest.PointsTestRunner(verbosity=2))
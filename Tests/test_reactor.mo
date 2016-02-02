within Seneca.Tests;

model test_reactor
import Seneca.Reactor.calc_reactor;
  Real a =1;
  Real b = 3;
  Real c;
  equation
  
    c = calc_reactor(a,b);

  annotation(Icon, Diagram);
end test_reactor;

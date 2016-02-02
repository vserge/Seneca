within Seneca.Reactor;

function calc_reactor
  input Real v_a;
  input Real v_b;
  output Real v_out;

  external "C" wmlfWSumm(v_out, v_a, v_b) annotation(Include="#include \"libwreactor-func.c\" ");
  
end calc_reactor;

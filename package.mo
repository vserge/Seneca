within ;
package Seneca "Library of Sulfur simulation models (version 0.0.1)"
  package UsersGuide "User's Guide/Руководство пользователя"
    extends Modelica.Icons.Information;

  class Overview "Overview"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>Библиотека Seneca предоставляет набор моделей для моделирования и исследования процессов очистки серы.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Элементы библиотеки</h4></p></td>
<td><p align=\"center\"><h4>Описание</h4></p></td>
</tr>
</table>
</html>"));
  end Overview;

  class Connectors "Connectors"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>The Chemical defines the two important <b>elementary connectors</b> for substance and for solution:</p>
<table cellspacing=\"0\" cellpadding=\"1\" border=\"1\"><tr>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br><h4>potential</h4></p><p>variables</p></td>
<td valign=\"top\"><h4>flow</h4><p>variables</p></td>
<td valign=\"top\"><h4>stream</h4><p>variables</p></td>
<td valign=\"top\"><h4>connector definition</h4></td>
<td valign=\"top\"><h4>icons</h4></td>
</tr>
<tr>
<td valign=\"middle\"><h4>substance</h4></td>
<td valign=\"middle\"><p>u .. electro-chemical potential of the chemical substance</p></td>
<td valign=\"middle\"><p>q .. molar flow of the chemical substance</p></td>
<td valign=\"middle\"></td>
<td valign=\"middle\"><p><br><a href=\"Chemical.Interfaces.SubstancePort\">Chemical.Interfaces.SubstancePort</a> </p></td>
<td valign=\"middle\"><p><img src=\"modelica://Chemical/Resources/Images/UsersGuide/ChemicalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"middle\"><h4>solution</h4></td>
<td valign=\"middle\"><p>p .. pressure of the solution</p><p>T .. temperature of the solution</p><p>v .. electric potential of the solution</p><p><br>n .. amount of all substances in the solution</p><p>m .. mass of the solution</p><p>V .. volume of the solution</p><p>G .. free Gibbs energy of the solution</p><p>Q .. electric charge of the solution</p><p>I .. ionic strength of the solution</p></td>
<td valign=\"middle\"><p>dV .. change of the volume of the solution</p><p>dH .. enthalpy change of the solution</p><p>i .. electric charge change of the solution</p><p><br><i>nj ..  amount of the substance</i></p><p><i>mj .. mass of the substance</i></p><p><i>Vj .. volume of the substance</i></p><p><i>Gj .. free Gibbs energy of the substance</i></p><p><i>Qj .. electric charge of the substance</i></p><p><i>Ij .. ionic strength of the substance</i></p></td>
<td valign=\"middle\"></td>
<td valign=\"middle\"><p><br><a href=\"Chemical.Interfaces.SolutionPort\">Chemical.Interfaces.SolutionPort</a></p></td>
<td valign=\"middle\"><p align=\"center\"><img src=\"modelica://Chemical/Resources/Images/UsersGuide/SolutionPort.png\"/></p></td>
</tr>
</table>
</html>"));
  end Connectors;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;

  class Version_0_1 "Version 0.0.1 (Dec. 10, 2015)"
    extends Modelica.Icons.ReleaseNotes;

  annotation (Documentation(info="<html>
<ul>
<li>Основые коды бибилиотеки расположены по адресу https://github.com/vserge/SENECA </li>
<li><font style=\"color: #333333; \">Components for solution, substance, chemical reaction, diffusion, gas dissolution, semipermeable membranes, chemical speciation of macromolecules, ..</font></li>
<li><font style=\"color: #333333; \">The library uses the Modelica Standard Libary (MSL) version 3.2.</font></li>
</ul>
</html>"));
  end Version_0_1;

  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

   annotation (Documentation(info="<html>
<p>Компания Стинс Коман</p>
<p>Sergey Volkov</p>
<p>email: svolkov@stinscoman.com</p>
</html>"));

  end Contact;

    class License "Modelica License"
       extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>Все права на данные материалы принадлежат компании Стинс Коман</p>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
    end License;

  class NewRelease "Publishing new release"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p><br>New release must be numbered by Semantic Versioning 2.0.0, see <a href=\"http://semver.org/\">semver.org</a>. </p>
<p><br>If minor version, then the conversion script must be written and connected with package Chemical using &QUOT;annotation(conversion(from(version=..)))&QUOT;! </p>
<p><br>To clean the code from dummy annotations try to use script <a href=\"https://github.com/dietmarw/trimtrailingwhitespaces\">ttws</a>. </p>
<p>To check english spelling try to use <a href=\"https://github.com/vlajos/misspell_fixer\">missspell_fixer</a>.</p>
<p><br>Update version number to &QUOT;X.Y.Z&QUOT;: </p>
<ul>
<li>At package Seneca annotation: (version=&QUOT;X.Y.Z&QUOT;) together with &QUOT;versionBuild&QUOT;, &QUOT;versionDate&QUOT; and &QUOT;dateModified&QUOT; attribute </li>
<li>At file &QUOT;./Seneca/libraryinfo.mos&QUOT; </li>
</ul>
<p><br>Update release notes: </p>
<ul>
<li>At UsersGuide.ReleaseNotes</li>
<li>At file &QUOT;./README.md&QUOT;, together with update of &QUOT;Current release&QUOT; section.</li>
</ul>
<p><br>Publish release in GitHub: </p>
<ul>
<li>Prepare release in &QUOT;master&QUOT; branch</li>
<li>Install, Check, Test, Test, Test.. </li>
<li>Draft a new <a href=\"
https://github.com/xogeny/impact/blob/master/resources/docs/modelica2015/paper/impact.md#impact-on-library-developers\">release from &QUOT;master&QUOT;</a> branch with number &QUOT;vX.Y.Z&QUOT; and with release notes. </li>
</ul>
</html>"));
  end NewRelease;

  annotation (DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Seneca </b>is a modelica package for <b>Sulfur Clauss processes </b>. It provides connectors and model components fitted for Sulfur Clauss models. </p>
</html>"));
  end UsersGuide;


 extends Modelica.Icons.Package;

end Seneca;

clear
clc
close all
Influenza_UK = [1838	1839	1840	1841	1842	1843	1844	1845	1846	1847	1848	1849	1850	1851	1852	1853	1854	1855	1856	1857	1858	1859	1860	1861	1862	1863	1864	1865	1866	1867	1868	1869	1870	1871	1872	1873	1874	1875	1876	1877	1878	1879	1880	1881	1882	1883	1884	1885	1886	1887	1888	1889	1890	1891	1892	1893	1894	1895	1896	1897	1898	1899	1900	1901	1902	1903	1904	1905	1906	1907	1908	1909	1910	1911	1912	1913	1914	1915	1916	1917	1918	1919	1920	1921	1922	1923	1924	1925	1926	1927	1928	1929	1930	1931	1932	1933	1934	1935	1936	1937	1938	1939	1940	1941	1942	1943	1944	1945	1946	1947	1948	1949	1950	1951	1952	1953	1954	1955	1956	1957	1958	1959	1960	1961	1962	1963	1964	1965	1966	1967	1968	1969	1970	1971	1972	1973	1974	1975	1976	1977	1978	1979	1980	1981	1982	1983	1984	1985	1986	1987	1988	1989	1990	1991	1992	1993	1994	1995	1996	1997	1998	1999	2000;...
                53	57	66	104	55	63	77	42	65	285	459	92	78	120	75	99	58	193	55	73	93	57	58	38	45	45	39	29	31	29	14	32	28	15	12	11	10	19	8	8	8	11	7	4	3	4	3	5	3	3	3	2	157	574	533	325	220	423	122	195	330	389	504	173.739196777344	223.545410156250	189.887481689453	168.804641723633	204.566787719727	183.740020751953	266.780029296875	287.637176513672	253.841354370117	181.716583251953	120.184860229492	147.383483886719	174.823638916016	161.333084106445	297.131835937500	253.767105102539	213.147354125977	3301.46362304688	1264.60046386719	286.331787109375	237.134872436523	562.701232910156	220.057739257813	489.392974853516	326.724029541016	228.460403442383	566.690429687500	196.388320922852	734.444458007813	126.102355957031	360.333099365234	327.255554199219	567.293273925781	138.853881835938	181.621353149414	148.311935424805	454.168792724609	117.602813720703	219.003051757813	286.294464111328	177.219116210938	88.4344863891602	332.540069580078	102.580390930176	70.3924484252930	129.868209838867	79.0456161499023	28.9590644836426	131.276107788086	89.0257797241211	360.812500000000	39.8134460449219	146.568725585938	40.9043693542481	67.1227035522461	58.7906074523926	149.553527832031	53.2266273498535	173.225219726563	23.9868927001953	153.735595703125	70.8997955322266	68.4224319458008	22.0394630432129	17.0752983093262	76.5534286499023	18.1471290588379	95.9169845581055	97.1312026977539	148.288146972656	14.1601562500000	60.9806785583496	63.9721794128418	24.9656848907471	29.1490974426270	135.444976806641	25.6268157958984	27.1021900177002	16.9264888763428	10.3622760772705	12.6122455596924	14.4406957626343	16.0429534912109	6.95993614196777	13.2769899368286	11.7402114868164	3.79068255424500	5.67123556137085	41.9379539489746	15.6445617675781	4.88685369491577	5.15198373794556	8.55135059356690	1.33029973506928	4.42736768722534	3.54014658927918	7.11797618865967	2.14616751670837	10.8022556304932	10.5293645858765];

% plot(Influenza_UK(1,:)',Influenza_UK(2,:)')

dmin = min(Influenza_UK(2,:));
dmax = max(Influenza_UK(2,:));

[Pandemic_1848] = est_parms_bpareto(Influenza_UK(2,11:52)',[],[],'1848');
[Pandemic_1890] = est_parms_bpareto(Influenza_UK(2,53:80)',[],[],'1890');
[Pandemic_1918] = est_parms_bpareto(Influenza_UK(2,81:119)',[],[],'1918');
[Pandemic_1957] = est_parms_bpareto(Influenza_UK(2,120:130)',[],[],'1957');
[Pandemic_1968] = est_parms_bpareto(Influenza_UK(2,131:end)',[],[],'1968');

figure(1)
subplot(5,1,1)
plot(Influenza_UK(1,11:52), bpareto_outbreakprob(Pandemic_1848.alpha',Pandemic_1848.dmax,Pandemic_1848.dmin,Pandemic_1848.dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on 
plot(Influenza_UK(1,11:52), bpareto_outbreakprob(Pandemic_1848.alpha',Pandemic_1848.dmax,Pandemic_1848.dmin,Pandemic_1848.dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_UK(1,11:52), bpareto_outbreakprob(Pandemic_1848.alpha',Pandemic_1848.dmax,Pandemic_1848.dmin,Pandemic_1848.dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
legend('2/3 of peak','1/2 of peak','1/3 of peak')
subplot(5,1,2)
plot(Influenza_UK(1,53:80), bpareto_outbreakprob(Pandemic_1890.alpha',Pandemic_1890.dmax,Pandemic_1890.dmin,Pandemic_1890.dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_UK(1,53:80), bpareto_outbreakprob(Pandemic_1890.alpha',Pandemic_1890.dmax,Pandemic_1890.dmin,Pandemic_1890.dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_UK(1,53:80), bpareto_outbreakprob(Pandemic_1890.alpha',Pandemic_1890.dmax,Pandemic_1890.dmin,Pandemic_1890.dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

subplot(5,1,3)
plot(Influenza_UK(1,81:119), bpareto_outbreakprob(Pandemic_1918.alpha',Pandemic_1918.dmax,Pandemic_1918.dmin,Pandemic_1918.dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_UK(1,81:119), bpareto_outbreakprob(Pandemic_1918.alpha',Pandemic_1918.dmax,Pandemic_1918.dmin,Pandemic_1918.dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_UK(1,81:119), bpareto_outbreakprob(Pandemic_1918.alpha',Pandemic_1918.dmax,Pandemic_1918.dmin,Pandemic_1918.dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

subplot(5,1,4)
plot(Influenza_UK(1,120:130), bpareto_outbreakprob(Pandemic_1957.alpha',Pandemic_1957.dmax,Pandemic_1957.dmin,Pandemic_1957.dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_UK(1,120:130), bpareto_outbreakprob(Pandemic_1957.alpha',Pandemic_1957.dmax,Pandemic_1957.dmin,Pandemic_1957.dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_UK(1,120:130), bpareto_outbreakprob(Pandemic_1957.alpha',Pandemic_1957.dmax,Pandemic_1957.dmin,Pandemic_1957.dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

subplot(5,1,5)
plot(Influenza_UK(1,131:end), bpareto_outbreakprob(Pandemic_1968.alpha',Pandemic_1968.dmax,Pandemic_1968.dmin,Pandemic_1968.dmax/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_UK(1,131:end), bpareto_outbreakprob(Pandemic_1968.alpha',Pandemic_1968.dmax,Pandemic_1968.dmin,Pandemic_1968.dmax/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_UK(1,131:end), bpareto_outbreakprob(Pandemic_1968.alpha',Pandemic_1968.dmax,Pandemic_1968.dmin,Pandemic_1968.dmax/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

natom     = 1000
min_dist2 = 2
L         = 100


min_dist2 = min_dist2*min_dist2 ;
atom_count = 0;
while (atom_count < natom)
  x=(rand()-0.5)*L ;
  y=(rand()-0.5)*L ;
  z=(rand()-0.5)*L ;  
  overlap = false;
  for i = 1 : atom_count
    r(1) = rx(i) - x ;
    r(2) = ry(i) - y ;
    r(3) = rz(i) - z ;
    rij2 = dot(r,r)  ;
    if ( rij2< min_dist2) 
      overlap = true;
      break
    end    
  end
  if (not (overlap))
    atom_count = atom_count + 1 ;
    rx(atom_count) = x ;
    ry(atom_count) = y ;
    rz(atom_count) = z ;
  end
end

filename = "atom_cord.xyz";
fid = fopen (filename, "w");
  fprintf (fid,'%d', natom) ;
  fprintf (fid,'\n \n') ;
for i = 1: natom
  #disp(i), disp(rx(i)), disp(ry(i)), disp(rz(i))
  fprintf (fid, '%s %f %f %f', "A", rx(i), ry(i), rz(i));
  fprintf (fid,'\n') ;
end
fclose (fid);
 
